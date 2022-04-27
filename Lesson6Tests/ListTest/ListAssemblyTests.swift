//
//  ListAssemblyTests.swift
//  Lesson6Tests
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

final class ListAssemblyTests: XCTestCase {
    
    func testViewAssembly() {
        let controller = ListAssembly.assemble()
        XCTAssert(controller is ListViewController)
        
        let sut = controller as! ListViewController
        XCTAssertNotNil(sut.output)
    }
    
    func testInteractorAssembly() {
        let presenter = (ListAssembly.assemble() as! ListViewController).output
        let interactor = (presenter as! ListPresenter).interactor
        XCTAssert(interactor is ListInteractor)
        
        let sut = interactor as! ListInteractor
        XCTAssertNotNil(sut.output)
    }
}

