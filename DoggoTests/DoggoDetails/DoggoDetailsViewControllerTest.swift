//
//  DoggoDetailsViewControllerTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoDetailsViewControllerTest: XCTestCase {
    
    var sut: DoggoDetailsViewController!
    var interactor: DoggoDetailsInteractorSpy!

    override func setUpWithError() throws {
        interactor = DoggoDetailsInteractorSpy()
        sut = DoggoDetailsViewController(interactor: interactor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDogInfo() throws {
        //When
        sut.viewWillAppear(true)
        
        //Then
        XCTAssert(interactor.isPresentDogInfoCalled, "Should present Dog info when view will appear")
    }

}
