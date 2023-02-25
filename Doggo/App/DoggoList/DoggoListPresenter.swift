//
//  DoggoListPresenter.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

protocol DoggoListPresenterProtocol {
    func presentDoggoList(with response: DoggoListModel.Response)
    func presentError(with error: DoggoListModel.ErrorCase)
}

class DoggoListPresenter: DoggoListPresenterProtocol {
    var viewController: DoggoListViewControllerProtocol?
    
    func presentDoggoList(with response: DoggoListModel.Response) {
        let viewModel = DoggoListModel.ViewModel(newDogs: response.newDogs)
        viewController?.displayList(with: viewModel)
    }
    
    func presentError(with error: DoggoListModel.ErrorCase) {
        viewController?.displayError(with: error)
    }
}

