//
//  SearchAppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 04.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SearchAppCellModel {
    let appName: String
    let company: String?
    let averageRating: Float?
    let downloadState: DownloadingApp.DownloadState
}
