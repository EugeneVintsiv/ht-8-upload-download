//
// Created by Eugene on 1/20/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation

protocol GiphyData: Codable { }

struct GiphyResponse<T: GiphyData>: Codable {
    public let data: T
    public let meta: Meta

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }

    public init(data: T, meta: Meta) {
        self.data = data
        self.meta = meta
    }
}

public struct IdData: Codable, GiphyData {
    public let id: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }

    public init(id: String) {
        self.id = id
    }

    static func extractId(with data: Data?) -> String? {
        guard let data = data else {
            return nil
        }

        do {
            let object = try JSONDecoder().decode(GiphyResponse<IdData>.self, from: data)
            return object.data.id
        } catch {
            print("Decode failed")
            return nil
        }
    }
}

public struct Meta: Codable {
    public let status: Int
    public let msg: String
    public let responseId: String

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case responseId = "response_id"
    }

    public init(status: Int, msg: String, responseId: String) {
        self.status = status
        self.msg = msg
        self.responseId = responseId
    }
}
