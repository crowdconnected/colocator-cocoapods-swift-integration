//
//  ViewController.swift
//  ColocatorSwiftIntegration
//
//  Created by TCode on 04/12/2019.
//  Copyright © 2019 CrowdConnected. All rights reserved.
//

import UIKit
import CCLocation
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLocationManager()
        configureCCLocationLibrary()
    }
    
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func configureCCLocationLibrary() {
        CCLocation.sharedInstance.delegate = self
        CCLocation.sharedInstance.setLoggerLevels(verbose: false,
                                                  info: true,
                                                  debug: false,
                                                  warning: true,
                                                  error: true,
                                                  severe: true)
        CCLocation.sharedInstance.registerLocationListener()
    }
}


extension ViewController: CCLocationDelegate {
    func ccLocationDidConnect() {
        // Colocatr connected successfully
    }
    
    func ccLocationDidFailWithError(error: Error) {
        // Colocator failed to connect
    }
    
    func didReceiveCCLocation(_ location: LocationResponse) {
        // Use location updates here
    }
    
    func didFailToUpdateCCLocation() {
        // Colocator failed to start/stop receiving location updates from server
    }
}

extension ViewController: CLLocationManagerDelegate { }
