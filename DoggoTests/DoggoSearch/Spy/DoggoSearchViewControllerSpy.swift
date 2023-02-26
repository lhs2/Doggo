//
//  DoggoSearchViewControllerSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo
import UIKit

final class DoggoSearchViewControllerSpy: UIViewController, DoggoSearchViewControllerProtocol {
    var isDisplayDoggoListCalled = false
    var isDisplayErrorCalled = false
    
    func displayDoggoList(with viewModel: DoggoSearchModel.ViewModel) {
        isDisplayDoggoListCalled = true
    }
    
    func displayError(with error: DoggoSearchModel.ErrorCase) {
        isDisplayDoggoListCalled = true
    }
    
    
}
