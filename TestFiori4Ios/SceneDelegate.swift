//
//  SceneDelegate.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 27/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit
import SAPFiori


import Foundation
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let logger = Logger.shared(named: "AppDelegateLogger")
    var sessionManager: OnboardingSessionManager<ApplicationOnboardingSession>!
    
    
    /// Delegate implementation of the application in a custom class
    var onboardingErrorHandler: OnboardingErrorHandler?
    private var flowProvider = OnboardingFlowProvider()
    
    private func initializeLogUploader() {
        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let mainScene = (scene as? UIWindowScene) else { return }
        self.initializeLogUploader()
        let mainVc = mainViewController()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
//        window?.rootViewController = mainVc
//        self.window!.rootViewController = FUIInfoViewController.init()
        window?.makeKeyAndVisible()
        window?.windowScene = mainScene
        
        Logger.root.logLevel = .debug
         self.initializeOnboarding()
        
        UINavigationBar.applyFioriStyle()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
//        OnboardingSessionManager.shared.unlock { error in
//            guard let error = error else {
//                return
//            }
//
//            self.onboardingErrorHandler?.handleUnlockingError(error)
//        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        OnboardingSessionManager.shared.lock { _ in }
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    /// Application specific code after successful onboard
    func afterOnboard() {
        guard let _ = self.sessionManager.onboardingSession else {
            fatalError("Invalid state")
        }

//        self.initializeRemoteNotification()
//        self.uploadLogs()
//        self.uploadUsageReport()
    }
    
    func initializeOnboarding() {
        let presentationDelegate = ApplicationUIManager(window: self.window!)
        self.onboardingErrorHandler = OnboardingErrorHandler()
        self.sessionManager = OnboardingSessionManager(presentationDelegate: presentationDelegate, flowProvider: self.flowProvider, delegate: self.onboardingErrorHandler)
        presentationDelegate.showSplashScreenForOnboarding { _ in }

        self.onboardUser()
    }

    /// Start onboarding a user
    func onboardUser() {
        self.sessionManager.open { error in
            if let error = error {
//                self.onboardingErrorHandler?.handleOnboardingError(error)
                return
            }
            self.afterOnboard()
        }
    }
}


// MARK: OnboardingSessionManager helper extension

@available(iOS 13.0, *)
extension OnboardingSessionManager {
    static var shared: OnboardingSessionManager<ApplicationOnboardingSession>! {
        return AppDelegate.shared.sessionManager
    }
}

