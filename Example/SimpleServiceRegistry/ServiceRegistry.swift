//
//  ServiceRegistry.swift
//  SimpleServiceRegistry
//
//  Created by Vincent Bernier on 17-01-17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import SimpleServiceRegistry

/// Building a Subclass to make this the only Singleton of the application
/// If needed we could add Notification on key registry method
class ServiceRegistry : SimpleServiceRegistry.ServiceRegistry {
    
    /// Singleton
    static let sharedInstance = ServiceRegistry()
}

