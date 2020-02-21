//
//  reservationTableView.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 22/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class reservationTableView: UITableView {
    
    var promptedProposition = propositions()
    var controller : UIScrollView!
    var numberOfRows = 0
    var touchDebut = 0
    var previous = 0
    var isPrompted = false
    var mainController : UIViewController!
    
    func setTableView (_ control : UIScrollView, _ mainController : UIViewController) {
        self.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: "topCell")
        self.delegate = self
        self.dataSource = self
        self.controller = control
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.mainController = mainController
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(Swipe))
        self.addGestureRecognizer(swipeGesture)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("previous est = \(previous), maintenant est \(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y < 0  && previous > Int(scrollView.contentOffset.y){
            if (self.controller.frame.origin.y - scrollView.contentOffset.y < self.controller.frame.height / 1.5 ){
                isScrollEnabled = false
                controller.showDismissBook(isPrompted: self.isPrompted, bookingView: self, controller: self.mainController)
            }
            UIView.animate(withDuration: 0.2) {
//                self.controller.frame.origin.y -= scrollView.contentOffset.y
            }
        }
        if previous > Int(scrollView.contentOffset.y){
            UIView.animate(withDuration: 0.2) {
//                self.controller.frame.origin.y = self.controller.frame.height - 2.2*(self.controller.frame.height / 3)
            }
        }
        previous = Int(scrollView.contentOffset.y)
    }
    
    @objc func Swipe(sender: UISwipeGestureRecognizer) {
        controller.showDismissBook(isPrompted: self.isPrompted, bookingView: self, controller: self.mainController)
    }
    

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setData(proposition : propositions) {
        self.promptedProposition = proposition
        numberOfRows = 4
        self.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension reservationTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! FUIObjectTableViewCell
            cell.headlineLabel.text = "Validation de la réservation"
            cell.detailImageViewSize = CGSize(width: 40, height: 40)
            cell.detailImage = #imageLiteral(resourceName: "park.png")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! FUIObjectTableViewCell
            cell.headlineText = "Parking :"
            cell.statusLabel.font = .boldSystemFont(ofSize: 20)
            cell.statusText = self.promptedProposition.parking.nom
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! FUIObjectTableViewCell
            cell.headlineText = "Position :"
            cell.statusLabel.font = .boldSystemFont(ofSize: 20)
            cell.statusText = "\(self.promptedProposition.place.position!)"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            let stackView = UIStackView(frame: CGRect(x: 0, y: 10, width: self.bounds.width - 20, height: 40))
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.setTitle("Valider", for: .normal)
            button.addTarget(self, action: #selector(validationBooking), for: .touchUpInside)
            button.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart2)
            button.translatesAutoresizingMaskIntoConstraints = false

            let button2 = UIButton()
            button2.layer.cornerRadius = 10
            button2.layer.masksToBounds = true
            button2.addTarget(self, action: #selector(dissmissFromView), for: .touchUpInside)
            button2.setTitle("Annuler", for: .normal)
            button2.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart1)
            button2.translatesAutoresizingMaskIntoConstraints = false

            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 8.0
            stackView.center.x = controller.center.x

            stackView.addArrangedSubview(button)
            stackView.addArrangedSubview(button2)
            
            cell.addSubview(stackView)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            return cell
        }
    }
    
    @objc func dissmissFromView(){
        controller.showDismissBook(isPrompted: self.isPrompted, bookingView: self, controller: self.mainController)
    }
    
    @objc func validationBooking(){
        controller.showDismissBook(isPrompted: self.isPrompted, bookingView: self, controller: self.mainController)
        FUIToastMessage.show(message: "La réservation a été faite")
    }
}

extension reservationTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 90
        default:
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 25))
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.center = view.center
        imageView.image = UIImage(imageLiteralResourceName: "swipper")
        
        self.addSubview(imageView)
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
