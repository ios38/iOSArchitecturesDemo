//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 01.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var collectionName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.trackName.text = cellModel.trackName
        self.artistName.text = cellModel.artistName
        self.collectionName.text = cellModel.collectionName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackName, self.artistName, self.collectionName].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addtrackNameLabel()
        self.addartistNameLabel()
        self.addcollectionNameLabel()
    }
    
    private func addtrackNameLabel() {
        self.contentView.addSubview(self.trackName)
        NSLayoutConstraint.activate([
            self.trackName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addartistNameLabel() {
        self.contentView.addSubview(self.artistName)
        NSLayoutConstraint.activate([
            self.artistName.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 4.0),
            self.artistName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addcollectionNameLabel() {
        self.contentView.addSubview(self.collectionName)
        NSLayoutConstraint.activate([
            self.collectionName.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 4.0),
            self.collectionName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.collectionName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
