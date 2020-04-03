//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 28.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailHeaderViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp
    
    private let imageDownloader = ImageDownloader()

    private var appDetailHeaderView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadImage()
        self.appDetailHeaderView.titleLabel.text = app.appName
        self.appDetailHeaderView.subtitleLabel.text = app.company
        self.appDetailHeaderView.ratingLabel.text = app.averageRating >>- { "\($0)" }
    }
    
    private func downloadImage() {
        guard let url = self.app.iconUrl else { return }
        let imageDownloaderProxy = ImageDownloaderProxy(imageDownloader: imageDownloader)
        imageDownloaderProxy.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.appDetailHeaderView.imageView.image = image
        }
    }
}
