//
//  iTunesAppKeys.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 29.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct Welcome {
    let screenshotUrls, ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [String] //[JSONAny]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let supportedDevices, advisories: [String]
    let isGameCenterEnabled: Bool
    let kind: String
    let features: [String]
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes, contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewURL: String
    let trackContentRating: String
    let trackID: Int
    let trackName: String
    let releaseDate: Date
    let genreIDS: [String]
    let formattedPrice, primaryGenreName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let minimumOSVersion: String
    let currentVersionReleaseDate: Date
    let releaseNotes: String
    let primaryGenreID: Int
    let sellerName, currency, version, wrapperType: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let welcomeDescription, bundleID: String
    let userRatingCount: Int
}
