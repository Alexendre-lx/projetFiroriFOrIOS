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
    
    private var propsArray : [propositions]!
    private var numberOfElements = 0
    private var rented = 0
    
    var bookingView : reservationTableView!
    var isBookingPrompted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mes propositions"
        tableView.register(FUITimelineCell.self, forCellReuseIdentifier: FUITimelineCell.reuseIdentifier)
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        bookingView = reservationTableView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height / 1.5), style: .plain)
        bookingView.setTableView(self.tableView, self)
        
        initHeader()
    }
    
    func jumpToBook(sender : IndexPath){
        bookingView.setData(proposition: propsArray[sender.row])
        (self.tableView as UIScrollView).showDismissBook(isPrompted: isBookingPrompted, bookingView: bookingView,controller: self)
    }
    
    func getData(){
        api.getPropositions() { (props) in
//            print(props)
            self.numberOfElements = props.proposition.count
            self.propsArray = props.proposition
            for prop in self.propsArray {
                if !prop.place.avaiability{
                    self.rented += 1
                }
            }
            self.tableView.reloadData()
        }
    }
    
    func initHeader(){
        getData()
        let item1 =  FUIKPIView()
        let item1Value = FUIKPIFractionItem(string: "\(propsArray.count)")
        item1.items = [item1Value]
        item1.captionlabel.text = "Places proposées"
        item1.tintColor = .preferredFioriColor(forStyle: .chart1)
        
        let item2 =  FUIKPIView()
        let item2Value = FUIKPIFractionItem(string: "\(rented)")
        item2.items = [item2Value]
        item2.captionlabel.text = "Places louées"
        item2.tintColor = .preferredFioriColor(forStyle: .chart1)
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            print("row \(indexPath) is deleted")
            self.propsArray.remove(at: indexPath.row)
            self.numberOfElements = propsArray.count
            tableView.deleteRows(at: [indexPath], with: .bottom)
//            initHeader()
//            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfElements
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier,
                                                            for: indexPath) as! FUIObjectTableViewCell
        cell.headlineText = "\(propsArray[indexPath.row].parking.nom!)"
        cell.subheadlineText = "Place : \(propsArray[indexPath.row].place.etage!) / \(propsArray[indexPath.row].place.position!)"
        cell.footnoteLabel.text = "\(propsArray[indexPath.row].date!)"
            switch propsArray[indexPath.row].place.avaiability {
            case true:
                cell.statusText = "disponible"
                cell.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive)
            default:
                cell.statusText = "indisponible"
                cell.statusLabel.textColor = .preferredFioriColor(forStyle: .negative)
            }
            cell.statusImageView.image = #imageLiteral(resourceName: "park.png")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if propsArray[indexPath.row].place.avaiability{
        FUIToastMessage.show(message: "La place est disponible")
        } else {
            FUIToastMessage.show(message: "La place est indisponible")
        }
    }
}

extension UIScrollView {
    @objc func showDismissBook(isPrompted : Bool, bookingView : reservationTableView, controller : UIViewController){
        var blurView = UIVisualEffectView()
        let blur = UIBlurEffect(style: .prominent)
        var containsBlur = false
        
        self.isScrollEnabled = true
        
        blurView.frame = controller.view.bounds
        blurView.effect = blur
        blurView.alpha = 0

//        print("le controller \(self.inputViewController) \n\n")
        
        for subview in controller.view.subviews {
            if subview as? UIVisualEffectView != nil {
                blurView = subview as! UIVisualEffectView
                containsBlur = true
            }
//            if subview as? UIBlurEffect != nil {
//                blur = subview as! UIBlurEffect
//            }
        }
        if !containsBlur {
            controller.view.addSubview(blurView)
            controller.view.addSubview(bookingView)
        }
        
        if isPrompted {
            UIView.animate(withDuration: 0.4, animations: {
                blurView.alpha = 0
                bookingView.frame.origin.y = UIScreen.main.bounds.height
            }) { (true) in
                 bookingView.isPrompted = !bookingView.isPrompted
            }
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                blurView.alpha = 1
                bookingView.frame.origin.y = controller.view.frame.height - bookingView.frame.height - 60
            }) { (true) in
                 bookingView.isPrompted = !bookingView.isPrompted
            }
        }
    }
}
