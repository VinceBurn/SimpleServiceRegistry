//
//  ServiceRegistry.swift
//  ServiceRegistryDev
//
//  Created by Vincent Bernier on 17-01-16.
//  Copyright © 2017 Vincent Bernier. All rights reserved.
//

import Foundation

public class ServiceRegistry {
    
    private var service: Any?
    
    public init() {}
    
    public func register<T>(_ service:Any, for type:T.Type) {
        self.service = service
    }
    
    public func safeService<T>(for type:T.Type) -> T? {
        return service as? T
    }
    
}

