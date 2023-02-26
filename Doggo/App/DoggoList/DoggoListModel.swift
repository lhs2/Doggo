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
        let id: Int
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
        var isGridMode: Bool = false
        var isRequestingList = false
        var isAsc = true
        var currentPage: Int = 1
        var newDogs: [Dog]
        
        func getDog(for indexPath: IndexPath) -> Dog {
            return newDogs[indexPath.row]
        }
    }
    
    enum ErrorCase {
        case noValue
        case noInternet
        case genericError
        
        func getErrorMessage()-> String {
            switch self {
            case .noValue:
                return "There isn't no more values to show."
            case .genericError:
                return "🚫 \nThere was an error with your request. Please, try again later."
            case .noInternet:
                return "🚫 \nThere was an error with your request. Please, try again later."
            }
        }
        
        func getDelayTime() -> Double {
            switch self {
            case .noValue:
                return 300.0
            case .noInternet:
                return 60.0
            case .genericError:
                return 30.0
            }
        }
    }
}
