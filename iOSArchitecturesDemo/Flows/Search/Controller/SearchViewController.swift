//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchView: SearchView {
        return self.view as! SearchView
    }
    
    private var searchMode: SearchMode = .apps
    
    internal var searchAppResults = [ITunesApp](){
        didSet {
            didSetSearchResults()
        }
    }

    internal var searchSongResults = [ITunesSong](){
        didSet {
            didSetSearchResults()
        }
    }

    
    var searchPresenter: SearchViewOutput?

    private struct Constants {
        static let appReuseId = "appReuseId"
        static let songReuseId = "songReuseId"
    }
    
    
    init(presenter: SearchViewOutput) {
        self.searchPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchModeControlDelegate = self
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.appReuseId)
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.songReuseId)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    func didSetSearchResults() {
        self.searchView.tableView.isHidden = false
        self.searchView.tableView.reloadData()
        self.searchView.searchBar.resignFirstResponder()
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func cellRegister() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch searchMode {
        case .apps:
            return searchAppResults.count
        case .songs:
            print("ViewController: songs.count: \(searchSongResults.count)")
            return searchSongResults.count
            //return searchSongResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch searchMode {
            
        case .apps:
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.appReuseId, for: indexPath)
            guard let cell = dequeuedCell as? AppCell else {
                return dequeuedCell
            }
            let app = self.searchAppResults[indexPath.row]
            let cellModel = AppCellModelFactory.cellModel(from: app)
            cell.configure(with: cellModel)
            return cell

        case .songs:
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.songReuseId, for: indexPath)
            let songCell = dequeuedCell as! SongCell
            let song = self.searchSongResults[indexPath.row]
            print("ViewController: song: \(song)")
            let cellModel = SongCellModelFactory.cellModel(from: song)
            print("ViewController: song: \(cellModel)")
            songCell.configure(with: cellModel)
            return songCell
        }
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch searchMode {
        case .apps:
            let app = searchAppResults[indexPath.row]
            self.searchPresenter?.viewDidSelectApp(app)
        case .songs:
            let song = searchSongResults[indexPath.row]
            self.searchPresenter?.viewDidSelectSong(song)
        }
    }
}

//MARK: - UISegmentedControlDelegate
extension SearchViewController: SearchModeControlDelegate {
    
    func searchModeSelected(_ searchMode: SearchMode) {
        self.searchMode = searchMode
        print("ViewController: searchModeSelected: \(self.searchMode)")
        self.searchView.tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        switch searchMode {
        case .apps:
            self.searchPresenter?.viewDidSearchApp(with: query)
        case .songs:
            self.searchPresenter?.viewDidSearchSong(with: query)
        }
    }
}

// MARK: - SearchViewInput
extension SearchViewController : SearchViewInput {
    
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    /*
    func requestApps(with query: String) {
        self.throbber(show: true)
        self.searchResults = []
        self.searchView.tableView.reloadData()
        
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.searchResults = []
                        self.showNoResults()
                        return
                    }
                    self.hideNoResults()
                    self.searchResults = apps
                    
                    self.searchView.tableView.isHidden = false
                    self.searchView.tableView.reloadData()
                    
                    self.searchView.searchBar.resignFirstResponder()
                }
                .withError {
                    self.showError(error: $0)
                }
        }
    }*/
}
