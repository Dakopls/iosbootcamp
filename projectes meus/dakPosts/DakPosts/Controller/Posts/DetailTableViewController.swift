//
//  DetailTableViewController.swift
//  Christmapps
//
//  Created by user on 08/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    private(set) var dataRetriever: DataRetriever!
    var contentProvider: DetailContent!
    private var content: Array<Section> = []
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    var url: String
    
    // MARK: - Life cycle
    init(dataRetriever: DataRetriever, contentProvider: DetailContent) {
        self.dataRetriever = dataRetriever
        self.contentProvider = contentProvider
        self.url = "http://jsonplaceholder.typicode.com/posts/1/comments?postId=" + String(contentProvider.post.id)
        super.init(style: .grouped)
        navigationController?.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        self.url = "http://jsonplaceholder.typicode.com/posts/1/comments?postId=" + String(contentProvider.post.id)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = contentProvider.title()
        self.tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        self.tableView.allowsSelection = false
        
        //activity indicator
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.activityIndicator.hidesWhenStopped = true
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        self.activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateComms()
    }
    
    func updateComms() {
        self.dataRetriever.retrieve(url: url, method: "GET") { (result: Result<Array<Comment>, Error>) in
            switch result {
            case .success(let comms):
                //print(comms)
                Thread.executeInMain {
                    self.contentProvider.createComms(comments: comms)
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contentProvider.sections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentProvider.rows(at: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return contentProvider.header(for: section)
    }

    // Create a standard footer that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
        return contentProvider.footer(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        let contentModel = contentProvider.row(at: indexPath)
        cell.Title?.text = contentModel.title
        cell.Content?.text = contentModel.value
        cell.contentView.backgroundColor = contentModel.bgColor
        return cell
    }
}
