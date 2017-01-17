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

//MARK:- Mock and Stubs
protocol Identifiable {
    var id: Int { get }
}
protocol Stringable {
    var string: String { get }
}

extension String : Stringable {
    var string: String {
        return self
    }
}

class ClassService : Equatable, Identifiable {
    let id: Int
    
    init(identifier: Int) {
        id = identifier
    }
    
    public static func ==(lhs: ClassService, rhs: ClassService) -> Bool {
        return lhs.id == rhs.id
    }
}

//MARK:- Tests
class ServiceRegistry_test: XCTestCase {
    let sut = ServiceRegistry()
}

//MARK:- Registering & Retrival
extension ServiceRegistry_test {
    func test_givenNoRegistration_whenRetrival_thenOptionalOfTheRightType() {
        let optStr: String? = nil
        let result = sut.service(for: String.self)
        XCTAssertEqual(String(describing: type(of:result)), String(describing: type(of:optStr)))
    }
    
    func test_givenNewInstance_whenRegister_thenCompile() {
        let service = "Hello"
        sut.register(service, for: String.self)
    }
    
    func test_givenRegister1Service_whenRetrival_thenService() {
        let service = "Hello"
        sut.register(service, for: String.self)
        let result = sut.service(for: String.self)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, service)
    }
    
    func test_givenRegister2Service_whenRetrival_thenCanGetBothService() {
        let service1 = "Hello"
        let service2 = ClassService(identifier: 4)
        sut.register(service1, for: Stringable.self)
        sut.register(service2, for: Identifiable.self)
        
        let characterable = sut.service(for: Stringable.self)
        let identifiable = sut.service(for: Identifiable.self)
        
        XCTAssertNotNil(characterable)
        XCTAssertNotNil(identifiable)
        XCTAssertEqual(characterable!.string, service1)
        XCTAssertEqual(identifiable!.id, service2.id)
        XCTAssertEqual(characterable as! String, service1)
        XCTAssertTrue(identifiable as! ClassService === service2)
    }
    
    func test_givenRegister2Service_whenUnWrapRetrival_thenCanGetBothService() {
        let service1 = "Hello"
        let service2 = ClassService(identifier: 4)
        sut.register(service1, for: Stringable.self)
        sut.register(service2, for: Identifiable.self)
        
        let characterable = sut.serviceUnwrapped(for: Stringable.self)
        let identifiable = sut.serviceUnwrapped(for: Identifiable.self)
        
        XCTAssertEqual(characterable.string, service1)
        XCTAssertEqual(identifiable.id, service2.id)
        XCTAssertEqual(characterable as! String, service1)
        XCTAssertTrue(identifiable as! ClassService === service2)
    }
    
    func test_givenRegister1Service_whenRegisteringSameService_thenOverride() {
        let service1 = "Hello"
        let service2 = "My Override"
        
        sut.register(service1, for: Stringable.self)
        sut.register(service2, for: Stringable.self)
        
        let result = sut.serviceUnwrapped(for: Stringable.self)
        XCTAssertEqual(result.string, service2)
    }
    
    func test_givenNoRegistration_whenTypes_thenEmptyStringArray() {
        let control = Set<String>()
        let result = sut.types
        XCTAssertEqual(result, control)
    }
    
    func test_givenRegister2Service_whenTypes_thenStringRepresentationOf2Services() {
        let service1 = "Hello"
        let service2 = ClassService(identifier: 4)
        sut.register(service1, for: Stringable.self)
        sut.register(service2, for: Identifiable.self)
        let control = Set<String>(["Stringable", "Identifiable"])
        
        let result = sut.types
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result, control)
    }
}

//MARK:- Unregister
extension ServiceRegistry_test {
    func test_givenNoRegistration_whenUnRegisterAll_thenNoTypes() {
        sut.unregisterAll()
        let result = sut.types
        XCTAssertEqual(result, Set<String>())
    }
    
    func test_givenRegistration2Service_whenUnregisterAll_thenNoTypesNorInstance() {
        sut.register("Stringable", for: Stringable.self)
        sut.register("String", for: String.self)
        
        sut.unregisterAll()
        let result = sut.types
        let stringService = sut.service(for:String.self)
        let stringableService = sut.service(for:Stringable.self)
        
        XCTAssertEqual(result, Set<String>())
        XCTAssertNil(stringService)
        XCTAssertNil(stringableService)
    }
    
}
