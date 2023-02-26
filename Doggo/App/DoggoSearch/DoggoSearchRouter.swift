//
//  DoggoSearchRouter.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import Foundation

protocol DoggoSearchRouterProtocol {
    func routeToDogDetails(with dog: DoggoSearchModel.Dog)
}

class DoggoSearchRouter: DoggoSearchRouterProtocol {
    weak var viewController: DoggoSearchViewControllerProtocol?

    func routeToDogDetails(with dog: DoggoSearchModel.Dog) {
        let factory = DoggoDetailsFactory()
        let doggo = DoggoDetaisModel.Dog(id: dog.id,
                                         name: dog.name,
                                         breed_group: dog.breed_group,
                                         temperament: dog.temperament,
                                         origin: dog.origin,
                                         image: nil)
        let dataInput = DoggoDetaisModel.DataInput(data: doggo)
        let vc = factory.newInstance(with: dataInput)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
