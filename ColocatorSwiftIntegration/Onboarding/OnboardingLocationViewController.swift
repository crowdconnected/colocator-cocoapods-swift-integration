//
//  OnboardingViewController.swift
//  ColocatorSwiftIntegration
//
//  Created by Mobile Developer on 11/02/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit

class OnboardingLocationViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionAllowLocation(_ sender: Any) {
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        self.finishOnboarding()
    }
    
    private func finishOnboarding() {
        DispatchQueue.main.async {
            UserDefaults.standard.set(true, forKey: "IsUserOnboardedKey")
            AppFlowController.switchRootViewController(usage: .appEngage)
        }
    }
}

extension OnboardingLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        finishOnboarding()
    }
}
