//
//  propositionFormTableViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 08/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori


class propositionFormTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(FUIListPickerFormCell.self, forCellReuseIdentifier: "pickerCell")
        self.tableView.register(FUIDatePickerFormCell.self, forCellReuseIdentifier: "datePickerCell")
        self.tableView.register(FUIButtonFormCell.self, forCellReuseIdentifier: "buttonCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! FUIListPickerFormCell
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as! FUIDatePickerFormCell
            cell.selectionStyle = .none
            cell.datePicker.date = Date.init()
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as!FUIButtonFormCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}

