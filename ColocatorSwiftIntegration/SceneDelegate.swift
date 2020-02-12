//
//  SceneDelegate.swift
//  ColocatorSwiftIntegration
//
//  Created by TCode on 04/12/2019.
//  Copyright © 2019 CrowdConnected. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let isUserOnboarded = UserDefaults.standard.value(forKey: "IsUserOnboardedKey") as? Bool ?? false
        
        if !isUserOnboarded {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let onboardingNavigationController = storyboard.instantiateViewController(withIdentifier: "OnboardingNavigationController")
                as? OnboardingNavigationController else {
                  return
              }
              self.window?.rootViewController = onboardingNavigationController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                as? MainViewController else {
                return
            }
            self.window?.rootViewController  = mainViewController
        }
        
        return
    }

//    func sceneDidDisconnect(_ scene: UIScene) {
//        // Called as the scene is being released by the system.
//        // This occurs shortly after the scene enters the background, or when its session is discarded.
//        // Release any resources associated with this scene that can be re-created the next time the scene connects.
//        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Called when the scene has moved from an inactive state to an active state.
//        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Called when the scene will move from an active state to an inactive state.
//        // This may occur due to temporary interruptions (ex. an incoming phone call).
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Called as the scene transitions from the background to the foreground.
//        // Use this method to undo the changes made on entering the background.
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//    }


}

