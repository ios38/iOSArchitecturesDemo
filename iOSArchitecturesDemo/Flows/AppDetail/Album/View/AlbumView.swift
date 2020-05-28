//
//  AlbumView.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 02.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AlbumView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 250)
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 5.0
        let albumView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        albumView.showsHorizontalScrollIndicator = false
        return albumView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //collectionView.frame = bounds
        collectionView.frame = CGRect(x: 5, y: 5, width: self.bounds.width - 10, height: self.bounds.height - 10)
    }

}
