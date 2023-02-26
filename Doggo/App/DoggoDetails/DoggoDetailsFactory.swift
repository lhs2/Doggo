//
//  DoggoDetailsFactory.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

class DoggoDetailsFactory {
    func newInstance(with data: DoggoDetailsModel.DataInput) -> DoggoDetailsViewController {
        let presenter = DoggoDetailsPresenter()
        let interactor = DoggoDetailsInteractor(presenter: presenter, data: data)
        let viewController = DoggoDetailsViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
