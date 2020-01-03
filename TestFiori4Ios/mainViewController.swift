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
        mainVc.title = "Accueil"
        
        let calendarView = calendarViewController()
        let calendarNavVc = navController(rootViewController: calendarView)
        calendarNavVc.title = "calendrier"
        self.viewControllers = [mainVc, calendarNavVc]
    }
}
