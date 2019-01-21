//
//  ViewController.swift
//  ht-8-upload-download
//
//  Created by Eugene on 1/17/19.
//  Copyright © 2019 Eugene. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var urlLinkTextInput: UITextField!
    @IBOutlet weak var imageIdLabel: UILabel!
    @IBOutlet weak var uploadImageBtn: UIButton!
    @IBOutlet weak var extractVideoLinkBtn: UIButton!
    @IBOutlet weak var videoLinkLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressPercent: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBAction func onUploadButtonClick(_ sender: Any) {
        uploadImageBtn.isEnabled = false
        imageIdLabel.isHidden = true

        imageService.uploadImageByLink(link: urlLinkTextInput.text) { (id) in
            self.imageIdLabel.text = id
            self.imageIdLabel.isHidden = false
            self.uploadImageBtn.isEnabled = true
        }
    }

    @IBAction func onExtractVideoLinkClicked(_ sender: Any) {
        extractVideoLinkBtn.isEnabled = false
        videoLinkLabel.isHidden = true
        downloadFile()
    }
    
    @IBAction func onPlayButtonClicked(_ sender: UIButton) {
        playVideo(path: self.lastUploadedFileUrl)
    }

//    DI
    private lazy var imageService: ImageService = ImageServiceImpl()
    private let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private lazy var downloadsSession : URLSession = {
        let config = URLSessionConfiguration.default
        // Warning: If an URLSession still exists from a previous download, it doesn't create
        // a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }()

    private let tmpLink = "https://media1.giphy.com/media/2SXRjZG012DlYRRBT8/giphy.mp4"
    private var lastUploadedFileUrl: URL? = nil

    override func viewDidLoad() {
        urlLinkTextInput.text = "https://loading.io/spinners/spiral/lg.rotate-spiral-spinner.gif"

//        reset labels text
        videoLinkLabel.text = ""
        imageIdLabel.text = ""
        super.viewDidLoad()
    }

    private func downloadFile() {
        imageService.downloadFileById(fileId: imageIdLabel.text) { (link) in
            self.videoLinkLabel.text = link
            self.videoLinkLabel.isHidden = false
            self.extractVideoLinkBtn.isEnabled = true
            self.progressView.progress = 0.0
            self.progressPercent.isHidden = false
            self.progressPercent.text = "0"
            self.playBtn.isHidden = true
            self.progressView.isHidden = false

            self.downloadsSession.downloadTask(with: URL(string: link!)!).resume()
        }
    }

}

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let sourceURL = downloadTask.originalRequest?.url else { return }
        let destinationURL = localFilePath(for: sourceURL)
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        self.lastUploadedFileUrl = destinationURL

        DispatchQueue.main.async {
            self.playBtn.isHidden = false
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else {
            return
        }

        let progress = Float(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))
        DispatchQueue.main.async {
            self.progressView.setProgress(progress, animated: true)
            self.progressPercent.text = String(format: "%.1f%%", progress * 100)
        }
    }

    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }

    private func playVideo(path location: URL?) {
        if location == nil {
            print("Video File not found")
            return
        }

        let player = AVPlayer(url: location!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}

