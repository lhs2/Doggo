//
//  DoggoSearchViewControllerTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoSearchViewControllerTest: XCTestCase {
    
    var sut: DoggoSearchViewController!
    var interactor: DoggoSearchInteractorSpy!
    var router = DoggoSearchRouter()
    override func setUpWithError() throws {
        
        interactor = DoggoSearchInteractorSpy()
        sut = DoggoSearchViewController(interactor: interactor, router: router)
        router.viewController = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDogSearch() throws {
        //When
        sut.interactor?.requestSearch(by: "Dog")
        
        //Then
        XCTAssert(interactor.isRequestSearchCalled, "Should present Dog info when view will appear")
    }

}
