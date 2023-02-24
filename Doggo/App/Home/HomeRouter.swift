//
//  HomeRouter.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation

protocol HomeRouterProtocol {
    func navigateToDetails(of user: HomeModel.Dog)
}

class HomeRouter: HomeRouterProtocol {
    
    var viewController: HomeViewControllerProtocol?
    
    func navigateToDetails(of user: HomeModel.Dog) {
    }
}
