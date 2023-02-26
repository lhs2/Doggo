//
//  HomeFactory.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit.UITabBarItem
import UIKit.UIViewController

class HomeFactory {
    func newInstance() -> HomeViewController {
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor, router: router)
        viewController.viewControllers = setupVC().map { UINavigationController(rootViewController: $0) }
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    private func setupVC()-> [UIViewController] {
        let doggoListFactory = DoggoListFactory()
        let doggoListVC = doggoListFactory.newInstance()
        let doggoListTabBarItem = UITabBarItem(title: "List", image: #imageLiteral(resourceName: "dog"), tag: 0)
        doggoListVC.tabBarItem = doggoListTabBarItem
        
        let doggoSearchFactory = DoggoSearchFactory()
        let doggoSearchVC = doggoSearchFactory.newInstance()
        let doggoSearchTabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), tag: 1)
        doggoSearchVC.tabBarItem = doggoSearchTabBarItem
        return [doggoListVC, doggoSearchVC]
    }
    
}

