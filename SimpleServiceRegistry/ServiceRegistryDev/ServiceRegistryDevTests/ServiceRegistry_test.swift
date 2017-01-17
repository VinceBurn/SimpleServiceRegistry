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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK:-
    func test_canInstantiate() {
        _ = ServiceRegistry()
    }
    
    //MARK:- Registering & Retrival
    func test_givenNoRegistration_whenSafeRetrival_thenOptionalOfTheRightType() {
        let sut = ServiceRegistry()
        let optStr: String? = nil
        let result = sut.safeService(for: String.self)
        
        XCTAssertEqual(String(describing: type(of:result)), String(describing: type(of:optStr)))
    }
    
    func test_givenNewInstance_whenRegister_thenCompile() {
        let sut = ServiceRegistry()
        let service = "Hello"
        
        sut.register(service, for: String.self)
    }
    
}
