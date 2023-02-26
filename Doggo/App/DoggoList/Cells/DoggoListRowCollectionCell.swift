//
//  DoggoListRowCollectionCell.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit
import Kingfisher

class DoggoListRowCollectionCell: UICollectionViewCell, DoggoListCollectionCellProtocol {
    static let identifier = "DoggoListRowCollectionCell"
    
    var data: DoggoListModel.Dog? {
        didSet {
            guard let data = data else { return }
            guard let imagePath = data.image?.url, let imageURL = URL(string: imagePath) else { return }
            
            imageView.kf.setImage(with: imageURL)
            nameLabel.text = data.name
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
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        updateConstraint()
    }
    
    func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
    }
    
    private func updateConstraint() {
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),

        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
