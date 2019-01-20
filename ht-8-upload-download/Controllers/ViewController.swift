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
    
    @IBAction func onUploadButtonClick(_ sender: Any) {
        uploadImageBtn.isEnabled = false
        imageIdLabel.isHidden = true

        imageService.uploadImageByLink(link: urlLinkTextInput.text) { (id) in
            self.imageIdLabel.text = id
            self.imageIdLabel.isHidden = false
            self.uploadImageBtn.isEnabled = true
        }
    }

    private lazy var imageService: ImageService = ImageServiceImpl()

    
    override func viewDidLoad() {
        urlLinkTextInput.text = "https://loading.io/spinners/spiral/lg.rotate-spiral-spinner.gif"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

