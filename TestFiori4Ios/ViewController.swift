//
//  ViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 27/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori



class ViewController: FUIFormTableViewController {
    
    var profilHeader : FUIProfileHeader!

    override func viewDidLoad() {
        super.viewDidLoad()
        setProfilHeader(name: "Alexendre", rang: "IOS", description: "Assis au bureau")
        self.title = "Accueil"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.register(FUIButtonFormCell.self, forCellReuseIdentifier: "buttonCell")
        // Do any additional setup after loading the view.
    }
    
    
    func setProfilHeader(name : String, rang: String, description : String ) {

        profilHeader = FUIProfileHeader()
        profilHeader.imageView.image = #imageLiteral(resourceName: "Image.jpg")
        profilHeader.headlineText = "Harry Potter"
        profilHeader.subheadlineText = "The boy wizard, the boy wizard"
        profilHeader.descriptionLabel.text = "This is a description"

        //create an activityControl and set to detail content view.
        let activityControl = FUIActivityControl()
        activityControl.maxVisibleItems = 5
        activityControl.itemSize = CGSize(width: 24, height: 24)
        activityControl.spacing = CGFloat(36.0)

        let phoneActivity = FUIActivityItem.phone
        let msgActivity = FUIActivityItem.message
        let emailActivity = FUIActivityItem.email
        activityControl.addActivities([phoneActivity, msgActivity, emailActivity])
        profilHeader.detailContentView = activityControl

        // If no animation is needed.
        self.tableView.tableHeaderView = profilHeader

        // If you want the scrolling animation.
        // self.tableView.addSubview(profileHeader)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
            case 0,2:
                return 60
            case 1:
                return 10
        case 3:
            return self.view.frame.height / 2
            default:
                return 0
        break
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row{
    case 0:
        let tmpCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! FUIButtonFormCell
        tmpCell.frame.size.width = tableView.frame.width / 2
        tmpCell.tintColor = UIColor.preferredFioriColor(forStyle: .negative)
        tmpCell.layer.cornerRadius = 10
        tmpCell.button.setTitle("Mes propositions", for: .normal)
        tmpCell.button.addTarget(self, action: #selector(goToMyProps), for: .touchUpInside)
        tmpCell.layer.masksToBounds = true
        tmpCell.layer.borderWidth = 1
        tmpCell.layer.borderColor = UIColor.preferredFioriColor(forStyle: .negative).cgColor
        cell = tmpCell
    case 2:
        let tmpCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! FUIButtonFormCell
        tmpCell.frame.size.width = tableView.frame.width / 2
       tmpCell.tintColor = .systemFill
        tmpCell.layer.cornerRadius = 10
        tmpCell.layer.borderColor = UIColor.systemBlue.cgColor
        tmpCell.layer.borderWidth = 1
        tmpCell.layer.masksToBounds = true
        tmpCell.button.setTitle("Proposer", for: .normal)
        cell = tmpCell
    case 3:
         let tmpCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! UITableViewCell
         let progressView = FUIKPIProgressView(frame: cell.frame)
         progressView.chartSize = .large
         progressView.center.x = self.view.center.x
         progressView.items = [FUIKPIFractionItem(string: "55") ,FUIKPIFractionItem(string: "/"), FUIKPIFractionItem(string: "5") ]
         progressView.progress = 0 / 100
         UIView.animate(withDuration: 100) {
            progressView.progress = 55 / 100
         }
         progressView.captionLabelText = "Places disponibles"
         progressView.tintColor = .preferredFioriColor(forStyle: .primary3)
         tmpCell.addSubview(progressView)
            cell = tmpCell
    default:
        break
    }
        return cell
    }
    
    @objc func goToMyProps(){
        let newVc = propositionsTableViewController()
        self.navigationController?.pushViewController(newVc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        default:
            return 0
        }
    }


}

