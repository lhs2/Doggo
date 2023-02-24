//
//  HomePresenter.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

protocol HomePresenterProtocol {
    func presentTabs()
}

class HomePresenter: HomePresenterProtocol {
    var viewController: HomeViewControllerProtocol?
    
    func presentTabs() {
    }
}
