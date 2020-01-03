//
//  propositionsTableViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 27/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class propositionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mes propositions"
        tableView.register(FUITimelineCell.self, forCellReuseIdentifier: FUITimelineCell.reuseIdentifier)
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        initHeader()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func initHeader(){
        let item1 =  FUIKPIView()
        let item1Value = FUIKPIFractionItem(string: "12")
        item1.items = [item1Value]
        item1.captionlabel.text = "Places proposées"
        item1.tintColor = .blue
        
        let item2 =  FUIKPIView()
        let item2Value = FUIKPIFractionItem(string: "5")
        item2.items = [item2Value]
        item2.captionlabel.text = "Places louées"
        item2.tintColor = .blue
        
        let kpiArray = [item1, item2]

        let KPIHeader = FUIKPIHeader()
        KPIHeader.items = kpiArray as [FUIKPIContainer]
        self.tableView.tableHeaderView  = KPIHeader
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier,
                                                            for: indexPath) as! FUIObjectTableViewCell
        cell.headlineText = "\(indexPath.row + 1) janvier"
        cell.subheadlineText = "Place : -1 / 6"
//        cell.detailImage = tool.image
        cell.descriptionText = "tool.description"
        cell.statusText = "Louée"
        cell.accessoryType = .detailButton

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = placeDetailsTableViewController()
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
