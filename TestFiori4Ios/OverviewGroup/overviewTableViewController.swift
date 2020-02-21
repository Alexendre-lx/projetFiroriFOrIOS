//
//  overviewTableViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 10/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit

class overviewTableViewController: UITableViewController {
    
    var propositionArray = [propositions]()
    
    var bookingView : reservationTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vue complète"
        api.getPropositions() { (props) in
            self.propositionArray = props.proposition
            self.tableView.reloadData()
        }
        
        bookingView = reservationTableView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height / 1.5), style: .plain)
        bookingView.setTableView(self.tableView, self)
        
        tableView.register(calendarDetailCell.self, forCellReuseIdentifier: "myOverviewCells")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return propositionArray.count
    }
    
    func jumpToBook(sender : IndexPath){
         bookingView.setData(proposition: propositionArray[sender.row])
         (self.tableView as UIScrollView).showDismissBook(isPrompted: bookingView.isPrompted, bookingView: bookingView,controller: self)
        (self.tableView as UIScrollView).isScrollEnabled = true
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jumpToBook(sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myOverviewCells", for: indexPath) as! calendarDetailCell
        cell.setData(proposition: propositionArray[indexPath.row])
        cell.statusText = "disponible"
        cell.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive)
        return cell
    }
    
}
