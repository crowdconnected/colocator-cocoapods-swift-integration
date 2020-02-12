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

class MainViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCCLocationLibrary()
    }
    
    private func configureCCLocationLibrary() {
        CCLocation.sharedInstance.delegate = self
        CCLocation.sharedInstance.setLoggerLevels(verbose: false,
                                                  info: false,
                                                  debug: false,
                                                  warning: false,
                                                  error: true,
                                                  severe: true)
        CCLocation.sharedInstance.registerLocationListener()
    }
}

extension MainViewController: CCLocationDelegate {
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
