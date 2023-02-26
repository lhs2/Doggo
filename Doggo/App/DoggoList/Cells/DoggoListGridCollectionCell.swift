//
//  DoggoListGridCollectionCell.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import UIKit

protocol DoggoListCollectionCellProtocol : UICollectionViewCell {
    var data: DoggoListModel.Dog? { get set }
}

class DoggoListGridCollectionCell: UICollectionViewCell, DoggoListCollectionCellProtocol {
    static let identifier = "DoggoListGridCollectionCell"
    
    var data: DoggoListModel.Dog? {
        didSet {
            guard let data = data else { return }
            guard let imagePath = data.image?.url, let imageURL = URL(string: imagePath) else { return }
            
            imageView.kf.setImage(with: imageURL)
            nameLabel.text = data.name
            updateConstraint()
        }
    }
    
    fileprivate let imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    fileprivate let nameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        //updateConstraint()
    }
    
    func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
    }
    
    private func updateConstraint() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            //nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12)

        ])
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
