//
//  SearchResponse.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 01.03.2020.
//  Copyright © 2020 Denis Zubkov. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
//    var wrapperType: String
//    var kind: String
//    var artistID: Int
//    var collectionID: Int
//    var trackID: Int
    var artistName: String
    var collectionName: String?
    var trackName: String
//    var collectionCensoredName: String
//    var trackCensoredName: String
//    var artistViewURL: String
//    var collectionViewURL: String
//    var trackViewURL: String
//    var previewURL: String
//    var artworkUrl30: String
//    var artworkUrl60: String
    var artworkUrl100: String?
//    var collectionPrice: Double
//    var trackPrice: Double
//    var releaseDate: Date
//    var collectionExplicitness: String
//    var trackExplicitness: String
//    var discCount: Int
//    var discNumber: Int
//    var trackCount: Int
//    var trackNumber: Int
//    var trackTimeMillis: Int
//    var country: String
//    var currency: String
//    var primaryGenreName: String
//    var isStreamable: Bool
}
