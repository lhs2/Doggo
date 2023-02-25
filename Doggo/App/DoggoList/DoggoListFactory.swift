//
//  DoggoListFactory.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation

class DoggoListFactory {
    func newInstance() -> DoggoListViewController {
        let presenter = DoggoListPresenter()
        let router = DoggoListRouter()
        let worker = DoggoListWorker()
        let interactor = DoggoListInteractor(presenter: presenter, worker: worker)
        let viewController = DoggoListViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
