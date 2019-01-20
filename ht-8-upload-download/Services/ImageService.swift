//
// Created by Eugene on 1/20/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation

protocol ImageService {
    func uploadImageByLink(link imageUrl: String?, onReceiveAction: @escaping ((String?) -> ()))

    func downloadFileById(fileId id: String?, onReceiveAction: @escaping ((String?) -> ()))
}

class ImageServiceImpl: ImageService {

    private let gyphyApi: GiphyApi

    init() {
        gyphyApi = GiphyApi()
    }

    func uploadImageByLink(link imageUrl: String?, onReceiveAction: @escaping ((String?) -> ())) {
        let defaultLink = "https://loading.io/spinners/spiral/lg.rotate-spiral-spinner.gif"
        gyphyApi.uploadUrl(imageLink: imageUrl ?? defaultLink, onReceiveAction: onReceiveAction)
    }


    func downloadFileById(fileId id: String?, onReceiveAction: @escaping ((String?) -> ())) {
        let defaultId = "2SXRjZG012DlYRRBT8"
        gyphyApi.extractVideoUrl(imageId: id ?? defaultId, onReceiveAction: onReceiveAction)
    }


}