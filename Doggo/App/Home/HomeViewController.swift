//
//  HomeViewController.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit

protocol HomeViewControllerProtocol: UICollectionViewController {
    
}

final class HomeViewController: UITabBarController, HomeViewControllerProtocol {
    
    weak var viewDelegate: HomeViewControllerProtocol?
    
    var visualView: HomeViewProtocol? = nil
    var interactor: HomeInteractorProtocol? = nil
    var router: HomeRouterProtocol? = nil
    
    init(visualView: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.interactor = interactor
        self.router = router
        self.view = visualView
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        interactor?.requestFeed()
    }
    
    
    private func setupNavigationBar() {
        title = "Feed"
        let cartButton   = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"),  style: .plain, target: self, action: nil)
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search"),  style: .plain, target: self, action: nil)
        cartButton.tintColor = .white
        searchButton.tintColor = .white
        navigationItem.rightBarButtonItems = [cartButton, searchButton]
    }
}
