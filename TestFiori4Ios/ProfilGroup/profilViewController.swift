//
//  profilViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class profilViewController: FUIFormTableViewController {
    
    let settingsList = ["Réglages","Contacts","Signaler un problème", "Aide", "Mentions légales", "Deconexion"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: "profilCell")
        
        let profileHeader = FUIProfileHeader()
        profileHeader.imageView.image = #imageLiteral(resourceName: "Image.jpg")
        profileHeader.headlineText = "Alain Potter"
        profileHeader.subheadlineText = "Codilog"
        profileHeader.descriptionLabel.text = "This is a description"
        
        self.tableView.tableHeaderView = profileHeader
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profilCell", for: indexPath)
        cell.textLabel?.text = settingsList[indexPath.row]
        
        return cell
    }
}

