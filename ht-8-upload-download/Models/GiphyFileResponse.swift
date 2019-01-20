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
    public let fixedHeightStill: The480_WStill
    public let originalStill: The480_WStill
    public let fixedWidth: FixedHeight
    public let fixedHeightSmallStill: The480_WStill
    public let fixedHeightDownsampled: FixedHeight
    public let preview: DownsizedSmall
    public let fixedHeightSmall: FixedHeight
    public let downsizedStill: The480_WStill
    public let downsized: The480_WStill
    public let downsizedLarge: The480_WStill
    public let fixedWidthSmallStill: The480_WStill
    public let previewWebp: The480_WStill
    public let fixedWidthStill: The480_WStill
    public let fixedWidthSmall: FixedHeight
    public let downsizedSmall: DownsizedSmall
    public let fixedWidthDownsampled: FixedHeight
    public let downsizedMedium: The480_WStill
    public let original: FixedHeight
    public let fixedHeight: FixedHeight
    public let looping: Looping
    public let originalMp4: DownsizedSmall
    public let previewGif: The480_WStill
    public let the480WStill: The480_WStill

    enum CodingKeys: String, CodingKey {
        case fixedHeightStill = "fixed_height_still"
        case originalStill = "original_still"
        case fixedWidth = "fixed_width"
        case fixedHeightSmallStill = "fixed_height_small_still"
        case fixedHeightDownsampled = "fixed_height_downsampled"
        case preview = "preview"
        case fixedHeightSmall = "fixed_height_small"
        case downsizedStill = "downsized_still"
        case downsized = "downsized"
        case downsizedLarge = "downsized_large"
        case fixedWidthSmallStill = "fixed_width_small_still"
        case previewWebp = "preview_webp"
        case fixedWidthStill = "fixed_width_still"
        case fixedWidthSmall = "fixed_width_small"
        case downsizedSmall = "downsized_small"
        case fixedWidthDownsampled = "fixed_width_downsampled"
        case downsizedMedium = "downsized_medium"
        case original = "original"
        case fixedHeight = "fixed_height"
        case looping = "looping"
        case originalMp4 = "original_mp4"
        case previewGif = "preview_gif"
        case the480WStill = "480w_still"
    }

    public init(fixedHeightStill: The480_WStill, originalStill: The480_WStill, fixedWidth: FixedHeight, fixedHeightSmallStill: The480_WStill, fixedHeightDownsampled: FixedHeight, preview: DownsizedSmall, fixedHeightSmall: FixedHeight, downsizedStill: The480_WStill, downsized: The480_WStill, downsizedLarge: The480_WStill, fixedWidthSmallStill: The480_WStill, previewWebp: The480_WStill, fixedWidthStill: The480_WStill, fixedWidthSmall: FixedHeight, downsizedSmall: DownsizedSmall, fixedWidthDownsampled: FixedHeight, downsizedMedium: The480_WStill, original: FixedHeight, fixedHeight: FixedHeight, looping: Looping, originalMp4: DownsizedSmall, previewGif: The480_WStill, the480WStill: The480_WStill) {
        self.fixedHeightStill = fixedHeightStill
        self.originalStill = originalStill
        self.fixedWidth = fixedWidth
        self.fixedHeightSmallStill = fixedHeightSmallStill
        self.fixedHeightDownsampled = fixedHeightDownsampled
        self.preview = preview
        self.fixedHeightSmall = fixedHeightSmall
        self.downsizedStill = downsizedStill
        self.downsized = downsized
        self.downsizedLarge = downsizedLarge
        self.fixedWidthSmallStill = fixedWidthSmallStill
        self.previewWebp = previewWebp
        self.fixedWidthStill = fixedWidthStill
        self.fixedWidthSmall = fixedWidthSmall
        self.downsizedSmall = downsizedSmall
        self.fixedWidthDownsampled = fixedWidthDownsampled
        self.downsizedMedium = downsizedMedium
        self.original = original
        self.fixedHeight = fixedHeight
        self.looping = looping
        self.originalMp4 = originalMp4
        self.previewGif = previewGif
        self.the480WStill = the480WStill
    }
}

public struct The480_WStill: Codable {
    public let url: String
    public let width: String
    public let height: String
    public let size: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case width = "width"
        case height = "height"
        case size = "size"
    }

    public init(url: String, width: String, height: String, size: String?) {
        self.url = url
        self.width = width
        self.height = height
        self.size = size
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
    public let url: String
    public let width: String
    public let height: String
    public let size: String
    public let mp4: String?
    public let mp4Size: String?
    public let webp: String
    public let webpSize: String
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

    public init(url: String, width: String, height: String, size: String, mp4: String?, mp4Size: String?, webp: String, webpSize: String, frames: String?, hash: String?) {
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
