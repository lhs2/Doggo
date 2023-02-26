//
//  DoggoDetails.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
import UIKit

protocol DoggoDetailsViewControllerProtocol {
    func displayDogInfo(for viewModel: DoggoDetaisModel.ViewModel)
}

final class DoggoDetailsViewController: UIViewController, DoggoDetailsViewControllerProtocol {

    private let breedNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()
    
    private let breedCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()
    
    private let originLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()
    
    private let temperamentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()
    
    weak var viewDelegate: HomeViewControllerProtocol?
    var interactor: DoggoDetailsInteractorProtocol? = nil
    
    init(interactor: DoggoDetailsInteractorProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
        setupView()
        addConstraints()
    }
    
    private func setupView() {
        view.addSubview(breedNameLabel)
        view.addSubview(breedCategoryLabel)
        view.addSubview(originLabel)
        view.addSubview(temperamentLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            breedNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            breedNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: breedNameLabel.trailingAnchor, constant: 8),
            
            breedCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            breedCategoryLabel.topAnchor.constraint(equalTo: breedNameLabel.bottomAnchor, constant: 2),
            view.trailingAnchor.constraint(equalTo: breedCategoryLabel.trailingAnchor, constant: 8),
            
            originLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            originLabel.topAnchor.constraint(equalTo: breedCategoryLabel.bottomAnchor, constant: 2),
            view.trailingAnchor.constraint(equalTo: originLabel.trailingAnchor, constant: 8),
            
            temperamentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: temperamentLabel.trailingAnchor, constant: 8),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        interactor?.presentDogInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func displayDogInfo(for viewModel: DoggoDetaisModel.ViewModel) {
        if let breedName = viewModel.data.name {
            breedNameLabel.attributedText = String.convertToAttributedString(with: "Breed name: ", regular: breedName)
        }
        
        if let breedCategory = viewModel.data.breed_group {
            breedCategoryLabel.attributedText = String.convertToAttributedString(with: "Breed category: ", regular: breedCategory)
        }
        
        if let origin = viewModel.data.origin {
            originLabel.attributedText = String.convertToAttributedString(with: "Origin: ", regular: origin)
        }
        
        if let temperament = viewModel.data.origin {
            originLabel.attributedText = String.convertToAttributedString(with: "Temperament: ", regular: temperament)
        }
    }
}
