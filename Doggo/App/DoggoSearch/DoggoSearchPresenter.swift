//
//  DoggoSearchPresenter.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

protocol DoggoSearchPresenterProtocol {
    func presentDoggoList(with response: DoggoSearchModel.Response)
    func presentError(with error: DoggoSearchModel.ErrorCase)
}

class DoggoSearchPresenter: DoggoSearchPresenterProtocol {
    var viewController: DoggoSearchViewControllerProtocol?
    
    func presentDoggoList(with response: DoggoSearchModel.Response) {
        let viewModel = DoggoSearchModel.ViewModel(newDogs: response.newDogs)
        viewController?.displayDoggoList(with: viewModel)
    }
    
    func presentError(with error: DoggoSearchModel.ErrorCase) {
        viewController?.displayError(with: error)
    }
}
