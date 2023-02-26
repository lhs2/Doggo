//
//  DoggoSearchFactory.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

class DoggoSearchFactory {
    func newInstance() -> DoggoSearchViewController {
        let presenter = DoggoSearchPresenter()
        let worker = DoggoSearchWorker()
        let router = DoggoSearchRouter()
        let interactor = DoggoSearchInteractor(presenter: presenter, worker: worker)
        let viewController = DoggoSearchViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
