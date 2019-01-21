//
// Created by Eugene on 1/20/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation


public struct DataClass: Codable, GiphyData {
    public let type: String
    public let id: String
    public let slug: String
    public let url: String
    public let bitlyGifUrl: String
    public let bitlyUrl: String
    public let embedUrl: String
    public let username: String
    public let source: String
    public let rating: String
    public let contentUrl: String
    public let sourceTld: String
    public let sourcePostUrl: String
    public let isSticker: Int
    public let importDatetime: String
    public let trendingDatetime: String
    public let images: Images
    public let title: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case slug = "slug"
        case url = "url"
        case bitlyGifUrl = "bitly_gif_url"
        case bitlyUrl = "bitly_url"
        case embedUrl = "embed_url"
        case username = "username"
        case source = "source"
        case rating = "rating"
        case contentUrl = "content_url"
        case sourceTld = "source_tld"
        case sourcePostUrl = "source_post_url"
        case isSticker = "is_sticker"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case images = "images"
        case title = "title"
    }

    public init(type: String, id: String, slug: String, url: String, bitlyGifUrl: String, bitlyUrl: String, embedUrl: String, username: String, source: String, rating: String, contentUrl: String, sourceTld: String, sourcePostUrl: String, isSticker: Int, importDatetime: String, trendingDatetime: String, images: Images, title: String) {
        self.type = type
        self.id = id
        self.slug = slug
        self.url = url
        self.bitlyGifUrl = bitlyGifUrl
        self.bitlyUrl = bitlyUrl
        self.embedUrl = embedUrl
        self.username = username
        self.source = source
        self.rating = rating
        self.contentUrl = contentUrl
        self.sourceTld = sourceTld
        self.sourcePostUrl = sourcePostUrl
        self.isSticker = isSticker
        self.importDatetime = importDatetime
        self.trendingDatetime = trendingDatetime
        self.images = images
        self.title = title
    }
}

public struct Images: Codable {
    public let original: FixedHeight
    public let originalMp4: DownsizedSmall

    enum CodingKeys: String, CodingKey {
        case original = "original"
        case originalMp4 = "original_mp4"
    }

    public init(original: FixedHeight, originalMp4: DownsizedSmall) {
        self.original = original
        self.originalMp4 = originalMp4
    }
}

public struct DownsizedSmall: Codable {
    public let width: String
    public let height: String
    public let mp4: String
    public let mp4Size: String

    enum CodingKeys: String, CodingKey {
        case width = "width"
        case height = "height"
        case mp4 = "mp4"
        case mp4Size = "mp4_size"
    }

    public init(width: String, height: String, mp4: String, mp4Size: String) {
        self.width = width
        self.height = height
        self.mp4 = mp4
        self.mp4Size = mp4Size
    }
}

public struct FixedHeight: Codable {
    public let url: String?
    public let width: String?
    public let height: String?
    public let size: String?
    public let mp4: String?
    public let mp4Size: String?
    public let webp: String?
    public let webpSize: String?
    public let frames: String?
    public let hash: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case width = "width"
        case height = "height"
        case size = "size"
        case mp4 = "mp4"
        case mp4Size = "mp4_size"
        case webp = "webp"
        case webpSize = "webp_size"
        case frames = "frames"
        case hash = "hash"
    }

    public init(url: String?, width: String?, height: String?, size: String?, mp4: String?, mp4Size: String?, webp: String, webpSize: String, frames: String?, hash: String?) {
        self.url = url
        self.width = width
        self.height = height
        self.size = size
        self.mp4 = mp4
        self.mp4Size = mp4Size
        self.webp = webp
        self.webpSize = webpSize
        self.frames = frames
        self.hash = hash
    }

    static func extractMp4(with data: Data?) -> String? {
        guard let data = data else {
            return nil
        }

        do {
            let object = try JSONDecoder().decode(GiphyResponse<DataClass>.self, from: data)
            return object.data.images.original.mp4
        } catch {
            print("Decode failed: \(error)")
            return nil
        }
    }
}

public struct Looping: Codable {
    public let mp4: String
    public let mp4Size: String

    enum CodingKeys: String, CodingKey {
        case mp4 = "mp4"
        case mp4Size = "mp4_size"
    }

    public init(mp4: String, mp4Size: String) {
        self.mp4 = mp4
        self.mp4Size = mp4Size
    }
}
