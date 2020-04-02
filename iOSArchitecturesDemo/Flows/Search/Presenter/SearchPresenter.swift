//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 30.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    
    var searchAppResults: [ITunesApp] { get set }

    var searchSongResults: [ITunesSong] { get set }

    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    
    func viewDidSearchApp(with query: String)

    func viewDidSearchSong(with query: String)

    func viewDidSelectApp(_ app: ITunesApp)

    func viewDidSelectSong(_ song: ITunesSong)
}

class SearchPresenter {
    private let searchService = ITunesSearchService()
    var viewInput: (UIViewController & SearchViewInput)?

    private func requestApps(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self]  results in
        guard let self = self else { return }
        self.viewInput?.throbber(show: false)
        results
            .withValue { apps in
                guard !apps.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchAppResults = apps
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }

    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self]  results in
        guard let self = self else { return }
        self.viewInput?.throbber(show: false)
        results
            .withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                print("SearchPresenter: requestSongs result: \(songs.count)")
                self.viewInput?.searchSongResults = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }

    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }

    private func openSongDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController(song: song)
        self.viewInput?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearchApp(with query: String) {
        self.requestApps(with: query)
    }

    func viewDidSearchSong(with query: String) {
        self.requestSongs(with: query)
    }

    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }

    func viewDidSelectSong(_ song: ITunesSong) {
        self.openSongDetails(with: song)
    }
}
