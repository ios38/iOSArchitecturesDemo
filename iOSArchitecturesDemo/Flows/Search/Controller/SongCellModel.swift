//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 01.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                             subtitle: model.artistName,
                             rating: model.collectionName)
    }
}
