//
//  ListPresenterTests.swift
//  Lesson6Tests
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

final class ListPresenterTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Lesson6Tests")
    
    var sut: ListPresenter!
    var view: ListViewMock!
    var interactor: ListInteractorMock!
    
    
    override func setUp() {
        super.setUp()
        
        sut = ListPresenter()
        interactor = ListInteractorMock()
        view = ListViewMock()
        
        view.output = sut
        sut.view = view
        sut.interactor = interactor
        interactor.output = sut
    }
    
    override func tearDown() {
        interactor = nil
        view = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testAssemble() {
        view.output = sut
        sut.view = view
        sut.interactor = interactor
        interactor.output = sut
    }
    
    func testViewIsReady() {
        view.expectation = expectation
        view.output?.viewIsReady()
        self.wait(for: [self.expectation], timeout: 5.0)
        XCTAssertEqual("John Lennon", view.artist?.name)
    }

    func testFetchData() {
        let service = ArtistServiceTest()
        service.fetchArtistList { result in
            switch result {
            case .success(let artists):
                print(artists)
            case .failure(_):
                XCTFail()
            }
        }
    }
}
