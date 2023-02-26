//
//  DoggoListRouter.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation

protocol DoggoListRouterProtocol {
    func routeToDogDetails(with dog: DoggoListModel.Dog)
}

class DoggoListRouter: DoggoListRouterProtocol {
    weak var viewController: DoggoListViewControllerProtocol?
    
    func routeToDogDetails(with dog: DoggoListModel.Dog) {
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
