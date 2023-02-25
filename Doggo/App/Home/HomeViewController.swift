//
//  HomeViewController.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    
}

final class HomeViewController: UITabBarController, HomeViewControllerProtocol {
    
    weak var viewDelegate: HomeViewControllerProtocol?
    
    var interactor: HomeInteractorProtocol? = nil
    var router: HomeRouterProtocol? = nil
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.interactor = interactor
        self.router = router
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func setupNavigationBar() {
        title = "Doggo"
    }
    

}
