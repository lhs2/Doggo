//
//  DoggoSearchInteractorTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoSearchInteractorTest: XCTestCase {
    var sut: DoggoSearchInteractor!
    var presenter: DoggoSearchPresenterSpy!
    var worker: DoggoSearchWorkerProtocol!
    
    override func setUpWithError() throws {
        presenter = DoggoSearchPresenterSpy()
        worker = DoggoSearchWorkerSpyFailure()
        sut = DoggoSearchInteractor(presenter: presenter, worker: worker)
    }

    override func tearDownWithError() throws {
    }

    func testDogInfoError() throws {
        //When
        sut.requestSearch(by: "33")
        
        //Then
        XCTAssert(presenter.isPresentErrorCalled, "Should present Dog error")
    }
    
    func testDogInfo() throws {
        //Given
        sut.worker = DoggoSearchWorkerSpySuccess()
        //When
        sut.requestSearch(by: "Dog")
        // Then
        XCTAssert(presenter.isPresentDoggoListCalled, "Should present Dog info")
    }

}
