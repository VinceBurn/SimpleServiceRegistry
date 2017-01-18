//
//  AppDelegate.swift
//  SimpleServiceRegistry
//
//  Created by Vincent Bernier on 01/16/2017.
//  Copyright (c) 2017 Vincent Bernier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init() {
        super.init()
        
        // Creating different service for different scenario
        let sizingRules: SizingRules
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            sizingRules = SizingRules_iPhone()
        case .pad:
            sizingRules = SizingRules_iPad()
        default:
            fatalError("Only userInterfaceIdiom phone and pad are supported.")
        }
        
        //  Registering the Service
        let serviceRegistry = ServiceRegistry.sharedInstance
        serviceRegistry.register(sizingRules, for: SizingRules.self)
    }
}

