//
//  DoggoSearchViewController.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import UIKit

protocol DoggoSearchViewControllerProtocol {
    func displayDoggoList(with viewModel: DoggoSearchModel.ViewModel)
    func displayError(with error: DoggoSearchModel.ErrorCase)
}

final class DoggoSearchViewController: UIViewController , DoggoSearchViewControllerProtocol{
    fileprivate var viewModel: DoggoSearchModel.ViewModel = .init(newDogs: [])
    
    private var searchBar: UISearchBar = {
        let searchBar:UISearchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var interactor: DoggoSearchInteractorProtocol? = nil
    var router: DoggoSearchRouterProtocol? = nil
    
    init(interactor: DoggoSearchInteractorProtocol, router: DoggoSearchRouterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
        self.router = router
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
        registerTableViewCells()
        setupInitialTableViewState()
    }
    
    private func registerTableViewCells() {
        tableView.register(DoggoSearchTableViewCell.self, forCellReuseIdentifier: DoggoSearchTableViewCell.identifier)
    }
    
    private func setupInitialTableViewState() {
        let initialState: DoggoSearchModel.ErrorCase = .initialState
        tableView.setEmptyMessage(initialState.getErrorMessage())
    }
    
    func displayDoggoList(with viewModel: DoggoSearchModel.ViewModel) {
        tableView.restore()
        self.viewModel.newDogs = viewModel.newDogs
        self.viewModel.isRequestingList = false
        tableView.reloadData()
    }
    
    func displayError(with error: DoggoSearchModel.ErrorCase) {
        viewModel.isRequestingList = false
        viewModel.newDogs.removeAll()
        tableView.setEmptyMessage(error.getErrorMessage())
        tableView.reloadData()
    }
    
    func setupView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
}

extension DoggoSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DoggoSearchTableViewCell.identifier, for: indexPath) as? DoggoSearchTableViewCell else {
                  return UITableViewCell()
          }
        cell.item = viewModel.getDog(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newDogs.count
    }
    
}

extension DoggoSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty == nil {
            setupInitialTableViewState()
        } else if !viewModel.isRequestingList {
            guard let searchText = searchBar.text else { return }
            viewModel.isRequestingList = true
            interactor?.requestSearch(by: searchText)
        }
        searchBar.endEditing(true)
    }
    
}
