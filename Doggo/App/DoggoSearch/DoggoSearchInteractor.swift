//
//  DoggoSearchInteractor.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

protocol DoggoSearchInteractorProtocol {
    func requestSearch(by name: String)
}

class DoggoSearchInteractor: DoggoSearchInteractorProtocol {
    var worker: DoggoSearchWorkerProtocol
    var presenter: DoggoSearchPresenterProtocol
        
    init(presenter: DoggoSearchPresenterProtocol, worker: DoggoSearchWorkerProtocol){
        self.presenter = presenter
        self.worker = worker
    }
    
    func requestSearch(by name: String) {
        worker.getList(with: name) { [weak self] apiResponse in
            if let newDoggoList = apiResponse {
                if newDoggoList.isEmpty {
                    let error: DoggoSearchModel.ErrorCase = .noValues
                    self?.presenter.presentError(with: error)
                    return
                }
                let response = DoggoSearchModel.Response(newDogs: newDoggoList)
                self?.presenter.presentDoggoList(with: response)
            } else {
                let error: DoggoSearchModel.ErrorCase = .parseError
                self?.presenter.presentError(with: error)
            }
        }
    }
}
