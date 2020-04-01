//
//  DescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 28.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

        // MARK: - Properties
        
        private let app: ITunesApp
                
        private var appDetailDescriptionView: AppDetailDescriptionView {
            return self.view as! AppDetailDescriptionView
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
            self.view = AppDetailDescriptionView()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.fillData()
        }
        
        // MARK: - Private
        
        private func fillData() {
            self.appDetailDescriptionView.titleLabel.text = "What's New"
            self.appDetailDescriptionView.versionLabel.text = "Version " + (app.version ?? "")
            self.appDetailDescriptionView.releaseDateLabel.text = "Release date " + (app.releaseDate ?? "")
            self.appDetailDescriptionView.releaseNotesLabel.text = app.releaseNotes
        }
        
    }
