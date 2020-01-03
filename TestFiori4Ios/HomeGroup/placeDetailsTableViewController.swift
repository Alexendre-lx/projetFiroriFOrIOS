//
//  placeDetailsTableViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class placeDetailsTableViewController: UITableViewController {
    
     var profilHeader : FUIProfileHeader!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.tableView.register(parkDetailCell.self, forCellReuseIdentifier: "rowCell")
        self.tableView.register(parkDetailHeaderCell.self, forCellReuseIdentifier: "headerCell")
        setParkDescription(position: "-1/6", Date: "02/02/2020", Lieu: "Codilog")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    func setParkDescription(position: String, Date: String, Lieu : String) {

        profilHeader = FUIProfileHeader()
        profilHeader.imageView.image = #imageLiteral(resourceName: "Image.jpg")
        profilHeader.headlineText = "Votre place \(position)"
        profilHeader.subheadlineText = Date
        profilHeader.descriptionLabel.text = Lieu

        // If no animation is needed.
        self.tableView.tableHeaderView = profilHeader

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightText
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50 // return height as per your requirement
        }
        return 0 // return height as per your requirement
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! parkDetailHeaderCell
            cell.setDatas()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath) as! parkDetailCell
            cell.setData()
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return 120
        }
    }
}


class parkDetailHeaderCell : FUIObjectTableViewCell {
    func setDatas () {
        self.subheadlineText = "Louée par"
    }
}

class parkDetailCell : FUIObjectTableViewCell {
    func setData () {
        detailImage = UIImage(named: "image.png")
        headlineText = "Jimmy Patrick"
        subheadlineText = "Il y a 10 min"
        footnoteText = "Commentaire"
//        statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
        iconImages = ["1"]
        accessoryType = .none
    }
}
