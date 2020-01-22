//
//  PostsTableViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    // MARK: - Properties
    private(set) var dataRetriever: DataRetriever!
    private var postList: Array<Post> = []
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    let filtered = SearchBarViewController()
    private lazy var searchController: UISearchController = {
        let s = UISearchController(searchResultsController: filtered)
        filtered.delegate = self
        s.searchResultsUpdater = self
        return s
    }()
    
    // MARK: - Life cycle
    init(dataRetriever: DataRetriever) {
        self.dataRetriever = dataRetriever
        super.init(style: .grouped)
        navigationController?.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Posts"
        self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        self.tableView.allowsSelection = true
        
        //search bar
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = true
        self.searchController.searchBar.placeholder = "Search Posts"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        //activity indicator
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.activityIndicator.hidesWhenStopped = true
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        self.activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePosts()
    }
    
    func updatePosts() {
        self.dataRetriever.retrieve(url: "https://jsonplaceholder.typicode.com/posts", method: "GET") { (result: Result<Array<Post>, Error>) in
            switch result {
            case .success(let posts):
                //el main thread és lliure ja que aquesta crida és asíncrona
                //només restringim al main thread la actualització de la tableView
                Thread.executeInMain {
                    self.postList = posts
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func pushDetail(_ post: Post) {
        let tableViewController = DetailTableViewController(dataRetriever: dataRetriever, contentProvider: DetailContent(post: post))
        self.navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell

        cell.Title.text = postList[indexPath.row].title
        cell.backgroundColor = UIColor.white
        cell.tintColor = UIColor.systemGray
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushDetail(postList[indexPath.row])
    }
}

extension PostsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //es pot millorar
        filtered.postList = postList.filter{ $0.title.lowercased().starts(with: searchController.searchBar.text!.lowercased()) }
    }
}

extension PostsTableViewController: CellUtilsDelegate {
    func cellDidSelect(cell: UITableViewCell, with post: Post) {
        pushDetail(post)
    }
}
