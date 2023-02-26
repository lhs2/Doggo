//
//  DoggoSearchPresenterTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoSearchPresenterTest: XCTestCase {
    var sut: DoggoSearchPresenter!
    var viewController: DoggoSearchViewControllerSpy!
    
    override func setUpWithError() throws {
        viewController = DoggoSearchViewControllerSpy()
        sut = DoggoSearchPresenter()
        sut.viewController = viewController
    }

    override func tearDownWithError() throws {
    }

    func testDogInfo() throws {
        //Given
        let response = DoggoSearchModel.Response(newDogs: [])
        
        //When
        sut.presentDoggoList(with: response)
        
        //Then
        XCTAssert(viewController.isDisplayDoggoListCalled, "Should display Dog info")
    }

}
