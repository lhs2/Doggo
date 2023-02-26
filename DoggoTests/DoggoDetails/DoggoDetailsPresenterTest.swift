//
//  DoggoDetailsPresenterTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoDetailsPresenterTest: XCTestCase {
    var sut: DoggoDetailsPresenter!
    var viewController: DoggoDetailsViewControllerSpy!
    
    override func setUpWithError() throws {
        viewController = DoggoDetailsViewControllerSpy()
        sut = DoggoDetailsPresenter()
        sut.viewController = viewController
    }

    override func tearDownWithError() throws {
    }

    func testDogInfo() throws {
        //Given
        let dog = DoggoDetailsModel.Dog(id: nil, name: nil, breed_group: nil, temperament: nil, origin: nil, image: nil)
        let response = DoggoDetailsModel.Response(data: dog)
        
        //When
        sut.presentDogInfo(with: response)
        
        //Then
        XCTAssert(viewController.isDisplayDogInfoCalled, "Should display Dog info when view will appear")
    }

}
