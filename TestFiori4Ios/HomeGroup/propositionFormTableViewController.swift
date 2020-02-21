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
    
    var propositionArray = [propositions]()
    let dateFormatter = DateFormatter()
    var datePickerOpened = false
    var selectedDate = Date()
    var currentPlace : place!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(FUIBaseTableViewCell.self, forCellReuseIdentifier: "normalCell")
        self.tableView.register(FUIListPickerFormCell.self, forCellReuseIdentifier: "pickerCell")
        self.tableView.register(FUIDatePickerFormCell.self, forCellReuseIdentifier: "datePickerCell")
        self.tableView.register(FUIButtonFormCell.self, forCellReuseIdentifier: "buttonCell")
        
        api.getPropositions() { (props) in
            self.propositionArray = props.proposition
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
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
       return 30
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.preferredFioriColor(forStyle: .primary4)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 60
            } else {
                   return 120
            }
        } else {
            return 120
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 60
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        if section == 1{
        let button2 = UIButton()
        button2.layer.cornerRadius = 10
        button2.layer.masksToBounds = true
        button2.addTarget(self, action: #selector(goToProps), for: .touchUpInside)
        button2.setTitle("Proposer", for: .normal)
        button2.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart1)
        button2.frame.size = CGSize(width: self.view.bounds.width - 20, height:55)
        button2.center.x = self.view.center.x
        
        view.addSubview(button2)
        }
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
            let picker = UIPickerView()
            picker.frame = cell.bounds
            picker.dataSource = self
            picker.delegate = self
            cell.addSubview(picker)
            return cell
        case 1:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as! FUIDatePickerFormCell
                cell.keyLabel.text = "Date de la disponibilité :"
                cell.selectionStyle = .none
                cell.datePicker.date = selectedDate
                cell.dateFormatter = dateFormatter
                cell.datePickerMode = .date
                cell.datePicker.isHidden = false
                 // MARK:  implement onChangeHandler
                 cell.onChangeHandler = {
                    newValue in
                   print(newValue)
                 }

                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
                let DatePicker = UIDatePicker(frame: cell.bounds)
                cell.addSubview(DatePicker)
                DatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
                return cell
            }
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        print(sender.date)
    }
    
    @objc func goToProps(_ sender: UIButton ) {
        FUIToastMessage.show(message: "La proposition de la place \(currentPlace.etage!) / \(currentPlace.position!) pour le \(selectedDate) a été faite", icon: #imageLiteral(resourceName: "park.png"), inView: self.navigationController!.view, withDuration: 2, maxNumberOfLines: 5)
        self.navigationController?.popViewController(animated: true)
    }
}

extension propositionFormTableViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("Place \(self.propositionArray[1].lodger.ownedPlaces[row].position!) / \(self.propositionArray[1].lodger.ownedPlaces[row].etage!)")
        return "Place \(self.propositionArray[1].lodger.ownedPlaces[row].position!) / \(self.propositionArray[1].lodger.ownedPlaces[row].etage!)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Place \(self.propositionArray[1].lodger.ownedPlaces[row].position!) / \(self.propositionArray[1].lodger.ownedPlaces[row].etage!)")
        currentPlace = place(etage: self.propositionArray[1].lodger.ownedPlaces[row].etage!, position: self.propositionArray[1].lodger.ownedPlaces[row].position!, avaiability:true)
    }
}

extension propositionFormTableViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.propositionArray[1].lodger.ownedPlaces.count
    }
    
    
    
}

extension propositionFormTableViewController : FUIListPickerDataSource {
    func numberOfRows(in listPickerTableView: UITableView) -> Int {
        return 5
    }
}

extension propositionFormTableViewController : FUIListPickerSearchResultsUpdating {
    func listPicker(_ listPicker: FUIListPicker, updateSearchResults forSearchString: String) {
    }
}

