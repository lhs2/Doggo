//
//  DoggoDetailsPresenter.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

protocol DoggoDetailsPresenterProtocol {
    func presentDogInfo(with response: DoggoDetaisModel.Response)
}

class DoggoDetailsPresenter: DoggoDetailsPresenterProtocol {
    var viewController: DoggoDetailsViewControllerProtocol?
    
    func presentDogInfo(with response: DoggoDetaisModel.Response) {
        let viewModel = DoggoDetaisModel.ViewModel(data: response.data)
        viewController?.displayDogInfo(for: viewModel)
    }
}
