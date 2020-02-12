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
        
        CCLocation.sharedInstance.start(apiKey: "PRIVATE_APP_KEY")
        
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
            CCLocation.sharedInstance.receivedSilentNotification(userInfo: userInfo, clientKey: "PRIVATE_APP_KEY") { isNewData in
                if isNewData {
                    completionHandler(.newData)
                } else {
                    completionHandler(.noData)
                }
            }
        }
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        CCLocation.sharedInstance.updateLibraryBasedOnClientStatus(clientKey: "PRIVATE_APP_KEY") { success in
            if success {
                completionHandler(.newData)
            } else {
                completionHandler(.noData)
            }
        }
    }

}

