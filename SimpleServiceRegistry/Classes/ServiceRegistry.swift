//
//  ServiceRegistry.swift
//  ServiceRegistryDev
//
//  Created by Vincent Bernier on 17-01-16.
//  Copyright © 2017 Vincent Bernier. All rights reserved.
//

import Foundation

public class ServiceRegistry {
    public init() {}
    
    public func register<T>(_ service:Any, for type:T.Type) {
        
    }
    
    public func safeService<T>(for type:T.Type) -> T? {
        return nil
    }
    
}

