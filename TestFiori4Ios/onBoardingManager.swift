//
//  onBoardingManager.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 30/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPFioriFlows
import SAPFiori
import SAPCommon

protocol  OnboardingManagerDelegate {
    func onboarded(onboardingContext: OnboardingContext)
}

@available(iOS 13.0, *)

class OnboardingManager {
    static let shared = OnboardingManager()
//    private init() {}
    
    private let logger = Logger.shared(named: "OnboardingManager")
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var delegate : OnboardingManagerDelegate?
    
    private var onboardingSteps : [OnboardingStep] = []
    
    
}
