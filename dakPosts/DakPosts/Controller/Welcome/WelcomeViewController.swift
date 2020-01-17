//
//  WelcomeViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    private let dataRetriver = URLSessionDataRetriever()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Start"
        self.configureNavBar()
        //self.checkFonts()
    }
    
    func configureNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.backgroundColor = UIColor(red:0.89,green:0.89,blue:0.89,alpha:1.0)
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    func checkFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    // MARK: - Actions
    @IBAction func startWasPressed(_ sender: UIButton) {
        let posts = PostsTableViewController(dataRetriever: dataRetriver)
        //present(UINavigationController(rootViewController: posts), animated: true, completion: nil)
        show(posts, sender: self)
    }
}
