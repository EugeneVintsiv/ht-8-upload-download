//
//  ViewController.swift
//  ht-8-upload-download
//
//  Created by Eugene on 1/17/19.
//  Copyright © 2019 Eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlLinkTextInput: UITextField!
    @IBOutlet weak var imageIdLabel: UILabel!
    @IBOutlet weak var uploadImageBtn: UIButton!
    @IBOutlet weak var extractVideoLinkBtn: UIButton!
    @IBOutlet weak var videoLinkLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func onUploadButtonClick(_ sender: Any) {
        uploadImageBtn.isEnabled = false
        imageIdLabel.isHidden = true

        imageService.uploadImageByLink(link: urlLinkTextInput.text) { (id) in
            self.imageIdLabel.text = id
            self.imageIdLabel.isHidden = false
            self.uploadImageBtn.isEnabled = true
        }
    }
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    private lazy var downloadsSession : URLSession = {
//        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
        let config = URLSessionConfiguration.default

            // Warning: If an URLSession still exists from a previous download, it doesn't create
            // a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }()

    let tmpLink = "https://media1.giphy.com/media/2SXRjZG012DlYRRBT8/giphy.mp4"
    @IBAction func onExtractVideoLinkClicked(_ sender: Any) {
        extractVideoLinkBtn.isEnabled = false
        videoLinkLabel.isHidden = true

        imageService.downloadFileById(fileId: imageIdLabel.text) { (link) in
            self.videoLinkLabel.text = link
            self.videoLinkLabel.isHidden = false
            self.extractVideoLinkBtn.isEnabled = true
            self.progressView.progress = 0.0

            print(link)
//            self.downloadsSession.invalidateAndCancel()

            self.progressView.isHidden = false
            self.downloadsSession.dataTask(with: URL(string: link!)!).resume()
        }
    }

//    DI
    private lazy var imageService: ImageService = ImageServiceImpl()

    override func viewDidLoad() {
        urlLinkTextInput.text = "https://loading.io/spinners/spiral/lg.rotate-spiral-spinner.gif"

//        reset labels text
        videoLinkLabel.text = ""
        imageIdLabel.text = ""
        super.viewDidLoad()
    }

    private func downloadFile(fileLink url: String?) {
        if url == nil {
//            may show error
            return
        }
    }

}

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download finished ")
        guard let sourceURL = downloadTask.originalRequest?.url else { return }
        let destinationURL = localFilePath(for: sourceURL)
        print(destinationURL)
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
            print("Download Finished")
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        print("Finished")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("In progress: \(totalBytesWritten)")
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else {
            return
        }

        let progress = Float(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))
        print("Download progress: \(progress)")

        print(progress)
        DispatchQueue.main.async { self.progressView.setProgress(progress, animated: true) }
    }

    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}

