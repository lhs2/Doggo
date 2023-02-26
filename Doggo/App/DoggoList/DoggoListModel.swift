//
//  DoggoListModel.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation

enum DoggoListModel {
    struct Request {
        let page: Int
    }
    
    typealias ApiResponse = [Dog]
    
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
        let newDogs: [Dog]
    }
    
    struct ViewModel {
        var isListMode: Bool = true
        var isRequestingList = false
        var currentPage: Int = 1
        var newDogs: [Dog]
        
        func getDog(for indexPath: IndexPath) -> Dog {
            return newDogs[indexPath.row]
        }
    }
    
    enum ErrorCase {
        case noInternet
        
        func getErrorMessage()-> String {
            return ""
        }
    }
}
