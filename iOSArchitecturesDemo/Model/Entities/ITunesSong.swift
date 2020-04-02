//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
    
    public var trackName: String
    public var artistName: String?
    public var collectionName: String?
    public var artwork: String?
    
    public var primaryGenreName: String?
    public var releaseDate: String

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artwork = "artworkUrl100"
        case primaryGenreName = "primaryGenreName"
        case releaseDate = "releaseDate"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.collectionName = try? container.decode(String.self, forKey: .collectionName)
        self.artwork = try container.decode(String.self, forKey: .artwork)
        self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let dateString = try? container.decode(String.self, forKey: .releaseDate),
            let date = formatter.date(from: dateString) {
            formatter.dateFormat = "YYYY"
            self.releaseDate = formatter.string(from: date)
        } else {
            self.releaseDate = ""
        }
    }

    // MARK: - Init
    
    internal init(trackName: String,
                  artistName: String?,
                  collectionName: String?,
                  artwork: String?,
                  primaryGenreName: String?,
                  releaseDate: String) {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.artwork = artwork
        self.primaryGenreName = artwork
        self.releaseDate = releaseDate
    }
}
