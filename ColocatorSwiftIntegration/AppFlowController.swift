//
//  AppFlowController.swift
//  ColocatorSwiftIntegration
//
//  Created by Mobile Developer on 11/02/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

enum UsageFlow {
    case onboarding
    case appEngage
}

class AppFlowController {
    
    static func switchRootViewController(usage: UsageFlow) {
        if usage == .onboarding {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let onboardingNavigationController = storyboard.instantiateViewController(withIdentifier: "OnboardingNavigationController")
                as? OnboardingNavigationController else {
                return
            }
            UIApplication.shared.keyWindow?.rootViewController = onboardingNavigationController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                as? MainViewController else {
                return
            }
            UIApplication.shared.keyWindow?.rootViewController = mainViewController
        }
    }
}
