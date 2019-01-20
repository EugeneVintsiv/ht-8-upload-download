//
// Created by Eugene on 1/19/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation
import UIKit

protocol GiphyNetworkApi {
    func uploadUrl(imageLink sourceLink: String, onReceiveAction: @escaping ((String?) -> ()))
}

class GiphyApi: GiphyNetworkApi {

    func uploadUrl(imageLink sourceLink: String, onReceiveAction: @escaping ((String?) -> ())) {
        let apiKey = "lc3aGasGwDbt4ZWhRNQGWsZIbS4dzuBu"
        let sourceLink = "https://loading.io/spinners/spiral/lg.rotate-spiral-spinner.gif"
        let link = "https://upload.giphy.com/v1/gifs?api_key=\(apiKey)&source_image_url=\(sourceLink)"

        var postRequest = URLRequest(url: URL(string: link)!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60.0)
        postRequest.httpMethod = "POST"

        URLSession.shared.dataTask(with: postRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil else { return }
            var result: String?
            defer { DispatchQueue.main.async { onReceiveAction(result) } }

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Error occurred while fetching data")
                return
            }
            result = IdData.extractId(with: data)
        }).resume()
    }

    func extractVideoUrl(imageId: String, onReceiveAction: @escaping ((String?) -> ())) {
        let apiKey = "lc3aGasGwDbt4ZWhRNQGWsZIbS4dzuBu"
        let id = "2SXRjZG012DlYRRBT8"
        let link = "https://api.giphy.com/v1/gifs/\(id)?api_key=\(apiKey)"

        var postRequest = URLRequest(url: URL(string: link)!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60.0)
        postRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: postRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil else { return }
            var result: String?
            defer { DispatchQueue.main.async { onReceiveAction(result) } }

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Error occurred while fetching data during extracting image url")
                return
            }
            result = FixedHeight.extractMp4(with: data)
        }).resume()
    }

}