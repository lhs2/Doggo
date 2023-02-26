//
//  DoggoDetailsInteractorTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoDetailsInteractorTest: XCTestCase {
    var sut: DoggoDetailsInteractor!
    var presenter: DoggoDetailsPresenterSpy!
    
    override func setUpWithError() throws {
        let dog = DoggoDetailsModel.Dog(id: nil, name: nil, breed_group: nil, temperament: nil, origin: nil, image: nil)
        let data = DoggoDetailsModel.DataInput(data: dog)
        presenter = DoggoDetailsPresenterSpy()
        sut = DoggoDetailsInteractor(presenter: presenter, data: data)
    }

    override func tearDownWithError() throws {
    }

    func testDogInfo() throws {
        //When
        sut.presentDogInfo()
        
        //Then
        XCTAssert(presenter.isPresentDogInfoCalled, "Should present Dog info when view will appear")
    }

}
