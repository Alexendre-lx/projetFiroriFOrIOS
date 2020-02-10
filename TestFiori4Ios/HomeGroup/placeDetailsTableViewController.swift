//
//  placeDetailsTableViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class parkDetailHeaderCell : FUIObjectTableViewCell {
    func setDatas () {
        self.subheadlineText = "Louée par"
    }
}

class parkDetailCell : FUIObjectTableViewCell {
    func setData (prop : propositions) {
        detailImage = UIImage(named: "image.png")
        headlineText = prop.lodger.prenom
        subheadlineText = "Il y a 10 min"
        footnoteText = "Commentaire"
        iconImages = ["1"]
        accessoryType = .none
    }
}

class placeDetailsTableViewController: UITableViewController {
    
     var profilHeader : FUIProfileHeader!
    var detailedPlace : propositions
    
    init(place : propositions) {
        self.detailedPlace = place
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.tableView.register(parkDetailCell.self, forCellReuseIdentifier: "rowCell")
        self.tableView.register(parkDetailHeaderCell.self, forCellReuseIdentifier: "headerCell")
        setParkDescription(position: "Étage \(detailedPlace.place.etage!), position : \(detailedPlace.place.position!)", Date: "\(detailedPlace.date!)", Lieu: detailedPlace.parking.nom!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerview = UIView()
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 20, height: 35)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Reserver", for: .normal)
        button.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart2)
        button.translatesAutoresizingMaskIntoConstraints = false
        footerview.addSubview(button)
        return footerview
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    func setParkDescription(position: String, Date: String, Lieu : String) {

        profilHeader = FUIProfileHeader()
        profilHeader.imageView.image = #imageLiteral(resourceName: "park.png")
        profilHeader.headlineText = "Votre place \(position)"
        profilHeader.subheadlineText = Date
        profilHeader.descriptionLabel.text = Lieu
        
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
            cell.setData(prop: detailedPlace)
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



