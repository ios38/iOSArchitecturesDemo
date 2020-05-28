//
//
//  AlbumViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 02.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var albumView: AlbumView {
        return self.view as! AlbumView
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
        self.view = AlbumView()
        //view.backgroundColor = .darkGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
