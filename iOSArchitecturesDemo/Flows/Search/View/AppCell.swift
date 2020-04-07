//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class AppCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var downloadProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Загрузить", for: .normal)
        return button
    }()
    
    var onDownloadButtonTap: (()->Void)?

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
    
    func configure(with cellModel: AppCellModel) {
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
        self.ratingLabel.text = cellModel.rating
    }
    
    @objc func buttonAction() {
        print("DownloadButton tapped")
        self.onDownloadButtonTap?()
    }

    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel, self.ratingLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
        self.addDownloadProgressLabel()
        self.addDownloadButton()

        self.downloadButton.setTitleColor(.lightGray, for: .normal)
        self.downloadButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addRatingLabel() {
        self.contentView.addSubview(self.ratingLabel)
        NSLayoutConstraint.activate([
            self.ratingLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 4.0),
            self.ratingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.ratingLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }

    private func addDownloadProgressLabel() {
        self.contentView.addSubview(self.downloadProgressLabel)
        NSLayoutConstraint.activate([
            self.downloadProgressLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 4.0),
            self.downloadProgressLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0),
            self.downloadProgressLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 90)
        ])
    }
    
    private func addDownloadButton() {
        self.contentView.addSubview(self.downloadButton)
        NSLayoutConstraint.activate([
            self.downloadButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4.0),
            self.downloadButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0),
            self.downloadButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 90),
            self.downloadButton.heightAnchor.constraint(equalToConstant: 25.0)
        ])
    }
}
