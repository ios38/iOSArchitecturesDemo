//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 02.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderViewController: UIViewController {

    // MARK: - Properties
    
    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()

    private var songDetailHeaderView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }
    
    // MARK: - Init
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadImage()
        self.songDetailHeaderView.trackNameLabel.text = song.trackName
        self.songDetailHeaderView.artistNameLabel.text = song.artistName
        self.songDetailHeaderView.collectionNameLabel.text = song.collectionName
        self.songDetailHeaderView.genreLabel.text = song.primaryGenreName
        self.songDetailHeaderView.releaseDateLabel.text = " • " + song.releaseDate
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        let imageDownloaderProxy = ImageDownloaderProxy(imageDownloader: imageDownloader)
        imageDownloaderProxy.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.imageView.image = image
        }
    }
}
