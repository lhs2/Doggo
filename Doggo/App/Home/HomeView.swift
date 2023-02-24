//
//  HomeView.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var delegate: (UITableViewDelegate & UITableViewDataSource)? { get set }
}

final class HomeView: UIView, HomeViewProtocol {
    
    weak var delegate: (UITableViewDataSource & UITableViewDelegate)?
        
    var tabBarView: UITabBar = {
       let tabBar = UITabBar()
        tabBar.backgroundColor = .white
        tabBar.tintColor = .orange
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    

    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    init(tabBarItens: [UITabBarItem]) {
        super.init(frame: CGRect.zero)
        tabBarView.items = tabBarItens
        setupView()
    }
    
    func setupView() {
        addSubview(tabBarView)
        updateConstraint()
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateConstraint() {
        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
    }
    
}
