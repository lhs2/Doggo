//
//  DoggoSearchWorker.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import Foundation

protocol DoggoSearchWorkerProtocol {
    func getList(with name: String, completion: @escaping (DoggoSearchModel.ApiResponse?) -> Void)
}

class DoggoSearchWorker: DoggoSearchWorkerProtocol {
    func getList(with name: String, completion: @escaping (DoggoSearchModel.ApiResponse?) -> Void) {
        let params: [CVarArg] = [name]
        
        Network.shared.request(.list, params, nil) { response in
            switch response {
            case .success(let data):
                do {
                    let apiResponse = try JSONDecoder().decode(DoggoSearchModel.ApiResponse.self, from: data)
                    completion(apiResponse)
                } catch (_) {
                    print("Error parse")
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}
