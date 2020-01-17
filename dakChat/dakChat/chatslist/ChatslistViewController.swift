//
//  ChatslistViewController.swift
//  dakChat
//
//  Created by user on 18/12/2019.
//  Copyright © 2019 dak. All rights reserved.
//

import UIKit

class ChatslistViewController: UITableViewController {

    let contacts: [(image: String, name: String, msg: String)] = [("Dadaku.png","Mamà","Demà ho miro"),("Dadaku.png","Papà","Demà ho miro"),("Dadaku.png","Roger","Demà ho miro"),("Dadaku.png","Ot","Demà ho miro"),("Dadaku.png","Moisés","Demà ho miro"),("Dadaku.png","Raúl","Demà ho miro"),("Dadaku.png","Irati","Demà ho miro"),("Dadaku.png","Joan","Demà ho miro")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ChatslistViewCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        tableView.allowsSelection = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatslistViewCell
        //UIImage(named: "pepito") Només cal posar el nom sense path relatiu ni res.
        cell.profileImage.image = UIImage(named: contacts[indexPath.row].image)!
        cell.profileName.text = contacts[indexPath.row].name
        cell.lastMsg.text = contacts[indexPath.row].msg
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ChatslistViewCell.height
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAP")
    }

}
