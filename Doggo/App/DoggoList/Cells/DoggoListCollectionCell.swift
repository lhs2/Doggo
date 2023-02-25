//
//  DoggoListCollectionCell.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit
import Kingfisher

enum CellMode {
    case list
    case grid
}

class DoggoListCollectionCell: UICollectionViewCell {
    static let identifier = "DoggoListCollectionCell"
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()

    }
    
    func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        updateConstraint(for: .list)
    }
    
    func updateConstraint(for mode: CellMode) {
//        imageView.constraints.removeAll()
//        nameLabel.constraints.removeAll()
        mode == .list ? updateConstraintsForList() : updateConstraintsForGrid()
    }
    
    private func updateConstraintsForList() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),

        ])
    }
    
    private func updateConstraintsForGrid() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //imageView.widthAnchor.constraint(equalToConstant: 50),
            //imageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            self.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
        ])
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
