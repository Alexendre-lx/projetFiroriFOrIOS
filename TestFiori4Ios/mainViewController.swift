//
//  mainViewController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 03/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import UIKit

class mainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = ViewController()
        let mainVc = navController(rootViewController: mainView)
        mainVc.setTabBarController(self)
        mainVc.title = "Accueil"
        
        let calendarView = calendarViewController()
        let calendarNavVc = navController(rootViewController: calendarView)
        calendarNavVc.setTabBarController(self)
        calendarNavVc.title = "calendrier"
        
        let overview = overviewTableViewController()
        let overviewNavVc = navController(rootViewController: overview)
        overviewNavVc.setTabBarController(self)
        overviewNavVc.title = "Vue complète"

//        let controller1 = navController(rootViewController: mainVc)
        self.viewControllers = [mainVc, calendarNavVc, overviewNavVc]
        self.tabBar.items?.first?.image = UIImage(named: "icon1.png")
        self.tabBar.items?[1].image = UIImage(named: "icon0.png")
        self.tabBar.items?[2].image = UIImage(named: "icon2.png")
    }
}
