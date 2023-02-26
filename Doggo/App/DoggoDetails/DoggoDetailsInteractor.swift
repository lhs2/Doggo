//
//  DoggoDetailsInteractor.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

protocol DoggoDetailsInteractorProtocol {
    var dog: DoggoDetailsModel.DataInput { get }
    
    func presentDogInfo()
}

class DoggoDetailsInteractor: DoggoDetailsInteractorProtocol {
    let presenter: DoggoDetailsPresenterProtocol
    var dog: DoggoDetailsModel.DataInput
    
    init(presenter: DoggoDetailsPresenterProtocol, data: DoggoDetailsModel.DataInput) {
        self.presenter = presenter
        self.dog = data
    }
    
    func presentDogInfo() {
        let response = DoggoDetailsModel.Response(data: dog.data)
        presenter.presentDogInfo(with: response)
    }
}
