//
//  AppDelegate.swift
//  ColocatorSwiftIntegration
//
//  Created by TCode on 04/12/2019.
//  Copyright © 2019 CrowdConnected. All rights reserved.
//

import UIKit
import CCLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        CCLocation.sharedInstance.start(apiKey: "CC_APP_KEY", urlString: "colocator.net:443/socket")
        UIApplication.shared.registerForRemoteNotifications()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        CCLocation.sharedInstance.addAlias(key: "apns_user_id", value: tokenString)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let source = userInfo["source"] as? String ?? ""
        if source == "colocator" {
            CCLocation.sharedInstance.receivedSilentNotification(userInfo: userInfo, clientKey: "CC_APP_KEY") { isNewData in
                if isNewData {
                    completionHandler(.newData)
                } else {
                    completionHandler(.noData)
                }
            }
        }
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        CCLocation.sharedInstance.updateLibraryBasedOnClientStatus(clientKey: "CC_APP_KEY") { success in
            if success {
                completionHandler(.newData)
            } else {
                completionHandler(.noData)
            }
        }
    }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

