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
    var propositionArray = [propositions]()
    var numberOfSect = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Accueil"
        let barButton = UIButton(type: .custom)
        barButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        barButton.setImage(#imageLiteral(resourceName: "Image.jpg"), for: .normal)
        barButton.addTarget(self, action: #selector(promptProfil), for: .touchUpInside)
        barButton.translatesAutoresizingMaskIntoConstraints = false
        barButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        barButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        barButton.layer.cornerRadius = 20
        barButton.layer.masksToBounds = true
        barButton.layer.borderWidth = 1
        barButton.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: barButton)
        
        tableView.separatorStyle = .none
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.register(FUIButtonFormCell.self, forCellReuseIdentifier: "buttonCell")
        self.tableView.isScrollEnabled = false
        api.getPropositions() { (props) in
            self.propositionArray = props.proposition
            self.tableView.reloadData()
            self.numberOfSect = 1
            self.setProfilHeader(name: "", rang: "", description: "")
            self.sizeHeaderToFit()
        }
    }
    
    @objc func promptProfil () {
        let profilView : profilViewController = profilViewController()
        profilView.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: profilView.view.frame.height / 2)
        self.present(profilView, animated: true, completion: nil)
    }
    
    private func sizeHeaderToFit() {
        let headerView = tableView.tableHeaderView!

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let height : CGFloat = 50
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame

        tableView.tableHeaderView = headerView
    }
    
    
    func setProfilHeader(name : String, rang: String, description : String ) {
        let kpiView1 = FUIKPIView()
        let kpiView1Metric = FUIKPIMetricItem(string: "\(propositionArray.count)")
        kpiView1.items = [kpiView1Metric]
        kpiView1.captionlabel.text = "Places disponibles"
        kpiView1.isEnabled = true
//        kpiView1.addTarget(self, action: #selector(goToProps), for: .touchUpInside)

        let kpiView2 = FUIKPIView()
        let kpiView2Metric = FUIKPIMetricItem(string: String(propositionArray.first?.lodger.ownedPlaces.count ?? 0))
        kpiView2.items = [kpiView2Metric]
        kpiView2.captionlabel.text = "Places que vous proposez"
        kpiView2.isEnabled = true
        kpiView2.addTarget(self, action: #selector(goToMyProps), for: .touchUpInside)
        
        let kpiArray = [kpiView1, kpiView2]
        let head = FUIKPIHeader(items: kpiArray)
        self.tableView.tableHeaderView  = head
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSect
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
            case 1:
                return 80
            case 3:
                return 300
        case 4:
            return 30
        case 5:
            return (self.view.frame.height - 40) / 3
            default:
                return 15
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row{
    case 1:
            let stackView = UIStackView(frame: CGRect(x: 0, y:20, width: self.view.bounds.width - 20, height: 40))
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.setTitle("Mes Propositions", for: .normal)
            button.addTarget(self, action: #selector(goToMyProps), for: .touchUpInside)
            button.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart2)
            button.translatesAutoresizingMaskIntoConstraints = false

            let button2 = UIButton()
            button2.layer.cornerRadius = 10
            button2.layer.masksToBounds = true
            button2.addTarget(self, action: #selector(goToProps), for: .touchUpInside)
            button2.setTitle("Proposer", for: .normal)
            button2.backgroundColor = UIColor.preferredFioriColor(forStyle: .chart1)
            button2.translatesAutoresizingMaskIntoConstraints = false

            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 8.0
            stackView.center.x = self.view.center.x

            stackView.addArrangedSubview(button)
            stackView.addArrangedSubview(button2)
            
            cell.addSubview(stackView)
            break
    case 3:
        let flow = FUICollectionViewLayout.horizontalScroll
        flow.itemSize = CGSize(width: 150, height: 260)
        flow.sectionInset.left = 10
        flow.sectionInset.top = 10
        flow.scrollDirection = .horizontal
        flow.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 30)
        let collectionHome = homeCollection(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300), collectionViewLayout: flow)
        collectionHome.initCollection(controller: self)
        cell.addSubview(collectionHome)
            break
    default:
        break
    }
        cell.selectionStyle = .none
        return cell
    }
    
    @objc func goToMyProps(){
        let newVc = propositionsTableViewController()
        self.navigationController?.pushViewController(newVc, animated: true)
    }
 
    @objc func goToProps(){
        let newVc = propositionFormTableViewController()
        self.navigationController?.pushViewController(newVc, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

