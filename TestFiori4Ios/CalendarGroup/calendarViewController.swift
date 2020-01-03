//
//  calendarViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class calendarViewController: UIViewController , FUICalendarViewDelegate {
    var tableView = UITableView()
    func calendarView(_ calendarView: FUICalendarView, didChangeSelections selections: [FUIDateSelection]) {
    }
    

    var calendarView = FUICalendarView() // initializes in the default month mode and shows the current date on startup

    override func viewDidLoad() {
       super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
       self.viewRespectsSystemMinimumLayoutMargins = false
       self.view.backgroundColor = .white
       self.view.addSubview(calendarView )
        self.tableView.register(calendarDetailCell.self, forCellReuseIdentifier: "calendarCells")
       calendarView .delegate = self
       calendarView.translatesAutoresizingMaskIntoConstraints = false
       calendarView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
       calendarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
       calendarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.view.addSubview(tableView)

    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        print(calendarView.frame)
         print(calendarView.bounds)
        
        tableView.frame = CGRect(x: 0, y: calendarView.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - calendarView.bounds.maxY)
//                tableView.translatesAutoresizingMaskIntoConstraints = false
//        //        tableView.topAnchor.constraint(equalToSystemSpacingBelow: calendarView.bottomAnchor, multiplier: 0).isActive = true
//                tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
//                tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }

    // Implement the FUICalendarViewDelegate methods

    // Called after a scrolling action
    func  calendarView(_ calendarView: FUICalendarView, didChangeVisibleDates visibleDates: FUIVisibleDates){

        }

    // Called when a cell ( displaying the date) is selected.
    func calendarView(_ calendarView: FUICalendarView, didSelectCell: FUICalendarItemCollectionViewCell, at: Date)
    {

    }

    // Called when a cell ( displaying the date) is deselected.
    func calendarView(_ calendarView: FUICalendarView, didDeselectCell: FUICalendarItemCollectionViewCell, at: Date)
    {

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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCells", for: indexPath) as! calendarDetailCell
        cell.setData()
        return cell
    }
    
    
}

class calendarDetailCell : FUIObjectTableViewCell {
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


