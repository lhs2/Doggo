//
//  DoggoListInteractor.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

protocol DoggoListInteractorProtocol {
    func requestList(with page: Int)
    
}

class DoggoListInteractor: DoggoListInteractorProtocol {
    let presenter: DoggoListPresenterProtocol
    let worker: DoggoListWorkerProtocol
        
    init(presenter: DoggoListPresenterProtocol, worker: DoggoListWorkerProtocol){
        self.presenter = presenter
        self.worker = worker
    }
    
    func requestList(with page: Int) {
        worker.getList(with: page) { [weak self] apiResponse in
            if let newDoggoList = apiResponse {
                let response = DoggoListModel.Response(newDogs: newDoggoList)
                self?.presenter.presentDoggoList(with: response)
            } else if !Reachability.shared.isReachable{
                self?.presenter.presentError(with: .noInternet)
            } else {
                self?.presenter.presentError(with: .genericError)
            }
            
        }
    }
}
