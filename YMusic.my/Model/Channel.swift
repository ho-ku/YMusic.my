//
//  Channel.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 20.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import Foundation

// MARK: - Channel
struct Channel: Codable {
    var items: [Item]
}

// MARK: - Item
struct Item: Codable {
    var statistics: Statistics
    var snippet: Snippet
}

// MARK: - Snippet
struct Snippet: Codable {
    var title: String
    var thumbnails: Thumbnails
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    var high: Default
}

// MARK: - Default
struct Default: Codable {
    var url: String
}

// MARK: - Statistics
struct Statistics: Codable {
    var subscriberCount, videoCount: String
}
