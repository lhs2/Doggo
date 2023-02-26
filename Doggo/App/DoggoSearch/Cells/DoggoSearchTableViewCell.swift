//
//  DoggoSearchTableViewCell.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import UIKit

final class DoggoSearchTableViewCell: UITableViewCell {
    static let identifier = "DoggoSearchTableViewCell"
    
    var item: DoggoSearchModel.Dog? {
        didSet {
            if let item = item {
                breedNameLabel.attributedText = String.convertToAttributedString(with: "Breed name: ", regular: item.name ?? "No info")
                breedGroupLabel.attributedText = String.convertToAttributedString(with: "Breed group: ", regular: item.breed_group ?? "No info")
                originLabel.attributedText = String.convertToAttributedString(with: "Origin: ", regular: item.origin ?? "No info")
                configureView()
            }
            
        }
    }
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private let breedGroupLabel: UILabel = {
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

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(view)
        view.addSubview(breedNameLabel)
        view.addSubview(breedGroupLabel)
        view.addSubview(originLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }
    
    private func configureView() {
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16),
            
            breedNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            breedNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            breedGroupLabel.topAnchor.constraint(equalTo: breedNameLabel.bottomAnchor, constant: 2),
            breedGroupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            originLabel.topAnchor.constraint(equalTo: breedGroupLabel.bottomAnchor, constant: 2),
            originLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.bottomAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 8),
        ])
    }
}
