//
//  navController.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 27/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit

class navController: UINavigationController {
    var barController : UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.preferredFioriColor(forStyle: .navigationBar)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.barTintColor = .preferredFioriColor(forStyle: .navigationBar)
    }
    func setTabBarController (_ tabBarController : UITabBarController){
        self.barController = tabBarController
    }
}
