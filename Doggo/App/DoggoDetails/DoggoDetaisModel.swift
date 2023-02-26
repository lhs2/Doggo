//
//  DoggoDetaisModel.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation

enum DoggoDetaisModel {
    struct DataInput {
        let data: Dog
    }
    
    struct Dog: Codable {
        let id: Int?
        let name: String?
        let breed_group: String?
        let temperament: String?
        let origin: String?
        let image: DogImage?
        
    }
    
    struct DogImage: Codable {
        let id: String?
        let url: String?
    }
    
    struct Response {
        let data: Dog
    }
    
    struct ViewModel {
        let data: Dog
    }
}
