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
    
    private lazy var listCVLayout: UICollectionViewFlowLayout = {
    let collectionFlowLayout = UICollectionViewFlowLayout()
//    collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: view.frame.width - 20, height: 70)
    collectionFlowLayout.minimumInteritemSpacing = 0
    collectionFlowLayout.minimumLineSpacing = 0
    collectionFlowLayout.scrollDirection = .vertical
        return collectionFlowLayout
    }()

    private lazy var gridCVLayout: UICollectionViewFlowLayout = {
    let collectionFlowLayout = UICollectionViewFlowLayout()
    collectionFlowLayout.scrollDirection = .vertical
//    collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: (view.frame.width - 20) / 2, height: 130)
    collectionFlowLayout.minimumInteritemSpacing = 2
    collectionFlowLayout.minimumLineSpacing = 2
        return collectionFlowLayout
    }()
    
    private lazy var collectionView:UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.minimumLineSpacing = 0
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout.itemSize = CGSize(width: view.frame.width - 20, height: 70)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DoggoListRowCollectionCell.self, forCellWithReuseIdentifier: DoggoListRowCollectionCell.identifier)
        cv.register(DoggoListGridCollectionCell.self, forCellWithReuseIdentifier: DoggoListGridCollectionCell.identifier)
        cv.isPagingEnabled = true
        return cv
    }()

    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        setupView()
        setupCollectionView()
        addConstraints()
        viewModel.isRequestingList = true
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(listCVLayout, animated: true)
        interactor?.requestList(with: viewModel.currentPage)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        let optionsMenuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") , style: .done, target: self, action: #selector(self.filterTapped))
        self.navigationItem.setRightBarButtonItems([optionsMenuBarButton], animated: true)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func displayList(with viewModel: DoggoListModel.ViewModel) {
        if !self.viewModel.isAsc {
            var reversedList = Array(viewModel.newDogs.reversed())
            reversedList.append(contentsOf: self.viewModel.newDogs)
            self.viewModel.newDogs = reversedList
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                              at: .top,
                                        animated: true)
        } else {
            self.viewModel.newDogs.append(contentsOf: viewModel.newDogs)
        }
        setTimerToRequest(with: 2.5)
        collectionView.reloadData()
    }
    
    func displayError(with error: DoggoListModel.ErrorCase) {
        setTimerToRequest(with: error.getDelayTime())
        showError(message: error.getErrorMessage())   
    }
    
    func setTimerToRequest(with seconds: Double) {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { [weak self] _ in
                self?.viewModel.isRequestingList = false
            }
        }
    }
}

extension DoggoListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        guard let cell = collectionView.cellForItem(at: indexPath) as? DoggoListCollectionCellProtocol else { return }
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
        var cell: DoggoListCollectionCellProtocol?
        if viewModel.isGridMode {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoggoListGridCollectionCell.identifier, for: indexPath) as? DoggoListGridCollectionCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoggoListRowCollectionCell.identifier, for: indexPath) as? DoggoListRowCollectionCell
        }
        guard let cell = cell else { return UICollectionViewCell() }
        cell.data = viewModel.getDog(for: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(collectionView.contentOffset.y >= (collectionView.contentSize.height - collectionView.bounds.size.height)) && !viewModel.isRequestingList {
            viewModel.currentPage += 1
            viewModel.isRequestingList = true
            interactor?.requestList(with: viewModel.currentPage)
       }
    }
    
}


extension DoggoListViewController: OptionsMenuViewControllerLogic {
    @objc private func filterTapped() {
        var popUpWindow: OptionsMenuViewController!
        popUpWindow = OptionsMenuViewController(isAsc: viewModel.isAsc, isGrid: viewModel.isGridMode)
        popUpWindow.delegate = self
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
    func filter(isAsc: Bool, isGrid: Bool) {
        var needUpdateView = false
        if isAsc != viewModel.isAsc {
            viewModel.isAsc = isAsc
            needUpdateView = true
            viewModel.newDogs = viewModel.newDogs.sorted(by: {
                isAsc ? $1.id > $0.id : $1.id < $0.id
            })
        }
        if isGrid != viewModel.isGridMode {
            viewModel.isGridMode = isGrid
            collectionView.collectionViewLayout.invalidateLayout()
            collectionView.setCollectionViewLayout(isGrid ? gridCVLayout : listCVLayout, animated: false)
            needUpdateView = true
        }
        if needUpdateView {
            collectionView.reloadData()
        }
    }
    
    
}
