//
//  ServiceRegistry.swift
//  ServiceRegistryDev
//
//  Created by Vincent Bernier on 17-01-16.
//  Copyright © 2017 Vincent Bernier. All rights reserved.
//

import Foundation

/// Goal: Store all services instance in a single place where they can be retreived in a loosely coupled way.
public class ServiceRegistry {
    
    fileprivate var services = [String: Any]()
    
    /// Init
    public init() {}
}

//MARK:- Registration and Retrival
extension ServiceRegistry {
    
    /// Registration base on a type.
    ///
    /// It would be best practices that the conforming Type would be a protocol implemented by the service. Calling this method multiple time with the same Type override the previously regsitered instance.
    /// - Important: Registration enforce that the service implement the Type in order for the retrival process to be able to cast the return to the registered Type.
    ///
    /// - Parameter service: any thing that implement the type parameter
    /// - Parameter type: A type that 'service' need to conforms to
    public func register<T>(_ service: T, for type: T.Type) {
        let id = String(describing: type)
        services[id] = service
    }
    
    /// Retriving a previously registred services and returns it cast to Type
    ///
    /// - Parameter type: The type of the registered service
    /// - Returns: the previously registered services for Type or 'nil' if nothing was registered for Type.
    public func service<T>(for type: T.Type) -> T? {
        let id = String(describing: type)
        return services[id] as? T
    }
    
    public func serviceUnwrapped<T>(for type: T.Type) -> T {
        return service(for: type)!
    }
}

