//
//  HomeFactory.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit.UITabBarItem

class HomeFactory {
    func newInstance() -> HomeViewController {
        let visualView = HomeView(tabBarItens: tabBarItens())
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(visualView: visualView, interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    func tabBarItens() -> [UITabBarItem] {
        return [UITabBarItem(title: "List", image: #imageLiteral(resourceName: "dog"), tag: 0), UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), tag: 1)]
    }
}

