//
//  DoggoListWorker.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation

protocol DoggoListWorkerProtocol {
    func getList(with page: Int, completion: @escaping (DoggoListModel.ApiResponse?) -> Void)
}

class DoggoListWorker: DoggoListWorkerProtocol {
    func getList(with page: Int, completion: @escaping (DoggoListModel.ApiResponse?) -> Void) {
        let params: [CVarArg] = ["\(page)"]
        
        Network.shared.request(.list, params, nil) { response in
            switch response {
            case .success(let data):
                do {
                    let apiResponse = try JSONDecoder().decode(DoggoListModel.ApiResponse.self, from: data)
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
