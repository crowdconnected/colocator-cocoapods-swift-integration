//
//  OnboardingNotificationsViewController.swift
//  ColocatorSwiftIntegration
//
//  Created by Mobile Developer on 12/02/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

class OnboardingNotificationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionAllowNotifications(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _,_ in
                self.goToNextOnboardingScreen()
            }
        } else {
            // Fallback to earlier version
            goToNextOnboardingScreen()
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        goToNextOnboardingScreen()
    }
    
    private func goToNextOnboardingScreen() {
        DispatchQueue.main.async {
            guard let onboardingLocationViewController = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingLocationViewController") as? OnboardingLocationViewController else { return }
            self.navigationController?.pushViewController(onboardingLocationViewController, animated: true)
        }
    }
}
