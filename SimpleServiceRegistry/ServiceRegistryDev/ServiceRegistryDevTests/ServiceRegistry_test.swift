//
//  ServiceRegistry_test.swift
//  ServiceRegistryDev
//
//  Created by Vincent Bernier on 17-01-16.
//  Copyright © 2017 Vincent Bernier. All rights reserved.
//

import XCTest
//  don't use @testable, we want to test the public API only
import ServiceRegistryDev

class ServiceRegistry_test: XCTestCase {
    
    let sut = ServiceRegistry()
    
    //MARK:- Registering & Retrival
    func test_givenNoRegistration_whenSafeRetrival_thenOptionalOfTheRightType() {
        let optStr: String? = nil
        let result = sut.safeService(for: String.self)
        XCTAssertEqual(String(describing: type(of:result)), String(describing: type(of:optStr)))
    }
    
    func test_givenNewInstance_whenRegister_thenCompile() {
        let service = "Hello"
        sut.register(service, for: String.self)
    }
    
    func test_givenRegister1Service_whenSafeRetrival_thenService() {
        let service = "Hello"
        sut.register(service, for: String.self)
        let result = sut.safeService(for: String.self)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, service)
    }
    
}
