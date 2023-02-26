//
//  DoggoDetailsViewControllerSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo
import UIKit

final class DoggoDetailsViewControllerSpy: UIViewController, DoggoDetailsViewControllerProtocol {
    var isDisplayDogInfoCalled = false
    
    func displayDogInfo(for viewModel: DoggoDetailsModel.ViewModel) {
        isDisplayDogInfoCalled = true
    }
    
}
