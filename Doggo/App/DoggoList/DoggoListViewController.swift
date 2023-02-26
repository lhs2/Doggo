//
//  DoggoListViewController.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit

protocol DoggoListViewControllerProtocol: UIViewController {
    func displayList(with viewModel: DoggoListModel.ViewModel)
    func displayError(with error: DoggoListModel.ErrorCase)
}

class DoggoListViewController: UIViewController, DoggoListViewControllerProtocol {
    fileprivate var viewModel: DoggoListModel.ViewModel = .init(newDogs: [])
    var interactor: DoggoListInteractorProtocol? = nil
    var router: DoggoListRouterProtocol? = nil
    
    init(interactor: DoggoListInteractorProtocol, router: DoggoListRouterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
        self.router = router
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 1
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DoggoListCollectionCell.self, forCellWithReuseIdentifier: DoggoListCollectionCell.identifier)
        cv.isPagingEnabled = true
        return cv
    }()

    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        setupView()
        setupCollectionView()
        addConstraints()
        viewModel.isRequestingList = true
        interactor?.requestList(with: viewModel.currentPage)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func displayList(with viewModel: DoggoListModel.ViewModel) {
        self.viewModel.newDogs.append(contentsOf: viewModel.newDogs)
        self.viewModel.isRequestingList = false
        collectionView.reloadData()
    }
    
    func displayError(with error: DoggoListModel.ErrorCase) {
        self.viewModel.isRequestingList = false
    }
}

extension DoggoListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        guard let cell = collectionView.cellForItem(at: indexPath) as? DoggoListCollectionCell else { return }
        if let doggo = cell.data {
            router?.routeToDogDetails(with: doggo)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.bounds.width, height: 70)
////        return viewModel.isListMode ? CGSize(width: collectionView.frame.width, height: 70) : CGSize(width: collectionView.frame.width/3.1, height: collectionView.frame.width/2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newDogs.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoggoListCollectionCell.identifier, for: indexPath) as? DoggoListCollectionCell else { return UICollectionViewCell() }
        cell.data = viewModel.getDog(for: indexPath) // need to change when grid
        //viewModel.isListMode ? cell.updateConstraint(for: .list) : cell.updateConstraint(for: .grid)
        return cell
    }
    
}

