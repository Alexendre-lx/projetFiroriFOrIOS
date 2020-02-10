//
//  homeCollection.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 15/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori

class homeCollection: UICollectionView {
    var numberOfElements = 0
    var propsArray : [propositions]!
    var controller : UIViewController!
    var bookingView : reservationTableView!
    var isBookingPrompted = false

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    func initCollection(controller : UIViewController){
        self.controller = controller
        self.register(homeCells.self, forCellWithReuseIdentifier: "homeCollectionCell")
        self.register(FUICollectionSectionHeaderFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        self.dataSource = self
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
        getData()
        bookingView = reservationTableView(frame: CGRect(x: 0, y: self.controller.view.frame.height, width: self.controller.view.frame.width, height: self.controller.view.frame.height / 1.5), style: .plain)
        bookingView.setTableView(self, self.controller)
    }
    
    func getData(){
        api.getPropositions() { (props) in
//            print(props)
            self.numberOfElements = props.proposition.count
            self.propsArray = props.proposition
            self.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func jumpToBook(sender : UIButton){
        if sender.accessibilityIdentifier != nil {
        bookingView.setData(proposition: propsArray[Int(sender.accessibilityIdentifier!)!])}
        showDismissBook(isPrompted: isBookingPrompted, bookingView: bookingView, controller: controller)
    }
}

extension homeCollection : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfElements
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! homeCells
        cell.primaryAction.setTitle("Reserver", for: .normal)
        cell.primaryAction.accessibilityIdentifier = "\(indexPath.row)"
        cell.secondaryAction.setTitle("Reserver", for: .normal)
        cell.itemSize = .standard
//        cell.layer.borderWidth = 0.1
        cell.primaryAction.addTarget(self, action:#selector(jumpToBook(sender:)), for: .touchUpInside)
        cell.title.text = "\(propsArray[indexPath.row].parking.nom!)"
        cell.subtitle.text = "Place \(propsArray[indexPath.row].place.etage!) / \(propsArray[indexPath.row].place.position!)"
        cell.status.text = "Disponible"
        cell.status.textColor = UIColor.preferredFioriColor(forStyle: .positive)
        cell.actionLayout = .double
        cell.detailImageView.image = #imageLiteral(resourceName: "parking.png")
        cell.detailImageView.contentMode = .scaleAspectFit
        cell.detailImageView.isCircular = true
        cell.initCell()
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! FUICollectionSectionHeaderFooterView
        view.titleLabel.text = "Les dernières disponibilités"
        let suiteButton = UIButton()
        view.addSubview(suiteButton)
        suiteButton.setTitle("Tout voir", for: .normal)
        suiteButton.setTitleColor(.lightGray, for: .normal)
        suiteButton.translatesAutoresizingMaskIntoConstraints = false
        suiteButton.addTarget(self, action: #selector(goToList), for: .touchUpInside)
        let rightAnchor = NSLayoutConstraint(item: suiteButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        NSLayoutConstraint.activate([rightAnchor])
        return view
    }
    
    @objc func goToList() {
        let navController = self.controller.navigationController as? navController
        navController?.barController.selectedIndex = 2
    }
}

class homeCells : FUIItemCollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initCell(){
        self.imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIImageView {
    func isCircular(){
        self.contentMode = .center
        self.layer.cornerRadius = self.frame.height / 2
    }
}
