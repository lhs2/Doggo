//
//  DoggoDetailsIntegrationTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoDetailsIntegrationTest: XCTestCase {
    var factory = DoggoDetailsFactory()
    var viewController: DoggoDetailsViewControllerProtocol!
    var interactor: DoggoDetailsInteractorProtocol!
    var presenter: DoggoDetailsPresenterProtocol!
    var dog: DoggoDetailsModel.Dog!
    
    override func setUpWithError() throws {
        let mock = loadDogMock()
        dog = DoggoDetailsModel.Dog(id: mock.id, name: mock.name, breed_group: mock.breed_group, temperament: mock.temperament, origin: mock.origin, image: nil)
        let data = DoggoDetailsModel.DataInput(data: dog)
        viewController = factory.newInstance(with: data)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlow() throws {
        // Given
        let vc = UIViewController()
        vc.present(viewController, animated: true)
        viewController.viewWillAppear(true)
    }

}
