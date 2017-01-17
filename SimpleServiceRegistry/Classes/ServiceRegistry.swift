//
//  ServiceRegistry.swift
//  ServiceRegistryDev
//
//  Created by Vincent Bernier on 17-01-16.
//  Copyright © 2017 Vincent Bernier. All rights reserved.
//

import Foundation

public class ServiceRegistry {
    
    private var services = [String: Any]()
    
    public init() {}
    
    public func register<T>(_ service:Any, for type:T.Type) {
        let id = String(describing: type)
        services[id] = service
    }
    
    public func service<T>(for type:T.Type) -> T? {
        let id = String(describing: type)
        return services[id] as? T
    }
    
}

