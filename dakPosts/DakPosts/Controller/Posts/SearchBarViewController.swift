//
//  FilteredPostsTableViewController.swift
//  Christmapps
//
//  Created by user on 13/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

protocol CellUtilsDelegate: class {
    func cellDidSelect(cell: UITableViewCell, with post: Post) -> Void
}

class SearchBarViewController: UITableViewController {
    var postList = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: CellUtilsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.allowsSelection = true
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = postList[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //al gestor de contingut li passem un post que l'omple en l'init
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let post = postList[indexPath.row]
        delegate?.cellDidSelect(cell: cell, with: post)
        //fer un delegate a postsTableViewController on es gestioni això
    }
}
