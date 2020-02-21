//
//  calendarViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori
let formatter = DateFormatter()

class calendarViewController: UIViewController {
    var tableView = UITableView()
    var currentDate = Date()
    var bookingView : reservationTableView!
    var propositionArray = [propositions]()
    

    func calendarView(_ calendarView: FUICalendarView, didChangeSelections selections: [FUIDateSelection]) {
    }

    var calendarView = FUICalendarView() // initializes in the default month mode and shows the current date on startup

    override func viewDidLoad() {
       super.viewDidLoad()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewRespectsSystemMinimumLayoutMargins = false
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(calendarView )
        self.tableView.register(calendarDetailCell.self, forCellReuseIdentifier: "calendarCells")
        calendarView.delegate = self
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.view.addSubview(tableView)
        
        bookingView = reservationTableView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height / 1.5), style: .plain)
        bookingView.setTableView(self.tableView, self)
        
        api.getPropositions() { (props) in
            self.propositionArray = props.proposition
            self.tableView.reloadData()
        }
    }

    func jumpToBook(sender : IndexPath){
        bookingView.setData(proposition: propositionArray[sender.row])
        (self.tableView as UIScrollView).showDismissBook(isPrompted: bookingView.isPrompted, bookingView: bookingView,controller: self)
    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        
        tableView.frame = CGRect(x: 0, y: calendarView.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - calendarView.bounds.maxY)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jumpToBook(sender: indexPath)
    }
}

extension calendarViewController : FUICalendarViewDelegate {
    func calendarView(_ calendarView: FUICalendarView, didSelectDate date: Date, cell: FUICalendarItemCollectionViewCell) {
        print(date)
        currentDate = date
        self.tableView.reloadData()
    }
    // Called before a cell ( displaying the date) is displayed.
    func calendar(_ calendarView: FUICalendarView, willDisplay cell: FUICalendarItemCollectionViewCell, forItemAt date: Date, indexPath: IndexPath) {
    }

    // Implement this method to set the title of the controller.
    // This method is called whenever there is a change in the status , for example. upon each scroll, the title is updated to the current month being displayed. When a
    // date is selected, then the title is updated to denote the corresponding month.
    func  calendarView(_ calendarView: FUICalendarView, didChangeTitleTo title: String) {
       self.navigationItem.title = title
    }
}

extension calendarViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        propositionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCells", for: indexPath) as! calendarDetailCell
        var passedProp = propositionArray[indexPath.row]
        passedProp.date = formatter.string(from: currentDate)
        cell.setData(proposition: passedProp)
        return cell
    }
}

class calendarDetailCell : FUIObjectTableViewCell {
    func setData (proposition : propositions) {
        headlineText = "Parking : \(proposition.parking.nom!)"
        subheadlineText = "Date : \(proposition.date!)"
        footnoteText = "Placement : Étage \(proposition.place.etage!) / Position \(proposition.place.position!)"
        statusText = "disponible"
        statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive)
        switch proposition.place.avaiability {
        case true:
            descriptionText = "Libre"
            descriptionLabel.textColor = UIColor.preferredFioriColor(forStyle: .positiveBackground)
        default:
            descriptionText = "Occupée"
            descriptionLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative)
        }
        iconImages = ["1"]
        accessoryType = .none
    }
}


