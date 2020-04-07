//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim Romanov on 31.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController) { // & SearchViewInput) {

        let searchService = ITunesSearchService()
        let downloadAppsService = FakeDownloadAppsService()
        let viewModel = SearchViewModel(searchService: searchService, downloadAppsService: downloadAppsService)
        let viewController = SearchViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
        
        //let presenter = SearchPresenter()
        //let viewController = SearchViewController(presenter: presenter)
        //presenter.viewInput = viewController
        //return viewController
    }
}
