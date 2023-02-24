//
//  HomeInteractor.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

protocol HomeInteractorProtocol {
    func requestTabs()
}

class HomeInteractor: HomeInteractorProtocol {
    let presenter: HomePresenterProtocol
        
    init(presenter: HomePresenterProtocol){
        self.presenter = presenter
    }
    
    func requestTabs() {
        
    }
}
