//
//  DoggoDetailsInteractor.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

protocol DoggoDetailsInteractorProtocol {
    var dog: DoggoDetaisModel.DataInput { get }
    
    func presentDogInfo()
}

class DoggoDetailsInteractor: DoggoDetailsInteractorProtocol {
    let presenter: DoggoDetailsPresenterProtocol
    var dog: DoggoDetaisModel.DataInput
    
    init(presenter: DoggoDetailsPresenterProtocol, data: DoggoDetaisModel.DataInput) {
        self.presenter = presenter
        self.dog = data
    }
    
    func presentDogInfo() {
        let response = DoggoDetaisModel.Response(data: dog.data)
        presenter.presentDogInfo(with: response)
    }
}
