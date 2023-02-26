//
//  DoggoSearchModels.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import Foundation

enum DoggoSearchModel {
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
        var isRequestingList = false
        var currentPage: Int = 1
        var newDogs: [Dog]
        
        func getDog(for indexPath: IndexPath) -> Dog {
            return newDogs[indexPath.row]
        }
    }
    
    enum ErrorCase {
        case initialState
        case parseError
        case noInternet
        case noValues
        
        func getErrorMessage()-> String {
            switch self {
            case .initialState:
                return "Use the Search bar to search for a dog!"
            case .parseError:
                return "🚫 \nThere was an error with your request. Please, try again later."
            case .noInternet:
                return ""
            case .noValues:
                return "There isn't any values for this search. Please, search for other dogs. 🐶"
            }
        }
    }
}
