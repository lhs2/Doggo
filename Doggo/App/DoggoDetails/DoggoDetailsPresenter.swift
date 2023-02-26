//
//  DoggoDetailsPresenter.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

protocol DoggoDetailsPresenterProtocol {
    func presentDogInfo(with response: DoggoDetailsModel.Response)
}

class DoggoDetailsPresenter: DoggoDetailsPresenterProtocol {
    var viewController: DoggoDetailsViewControllerProtocol?
    
    func presentDogInfo(with response: DoggoDetailsModel.Response) {
        let viewModel = DoggoDetailsModel.ViewModel(data: response.data)
        viewController?.displayDogInfo(for: viewModel)
    }
}
