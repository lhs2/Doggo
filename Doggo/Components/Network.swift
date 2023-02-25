//
//  Network.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation
import Alamofire

class Network {
    
    enum Result<Value, Error: Swift.Error> {
        case success(Data)
        case failure(Swift.Error)
    }
    
    typealias Handler = (Result<Data, Error>) -> Void
    
    
    static let shared: Network = Network()
    
    private init() {
        manager = Alamofire.Session()
    }
    
   
    private let manager: Alamofire.Session!
    
    enum Endpoint {
        case list
        case search
        
        internal var method: HTTPMethod {
            switch self {
            case .list      : return .get
            case .search  : return .get
            }
        }
        
        fileprivate var URL: String{
            switch self {
                
            case .list:
                return "breeds?limit=10&page=%@"
            case .search:
                return "breeds/search?q=%@&limit=10&page=%@"
            }
            
        }
        
        fileprivate var headers: HTTPHeaders {
            switch self {
            default:
                return [
                    "Accept": "application/json",
                    "x-api-key": API_KEY
                ]
                
            }
        }
        
    }
    
    func request(_ endpoint        : Endpoint,
                 _ pathParamenters : [CVarArg]?,
                 _ parameters      : [String:Any]?,
                 handler: @escaping Handler) {
        
        var requestURL = baseURL + endpoint.URL
        
        if pathParamenters != nil && (pathParamenters?.count)! > 0 {
            requestURL = String.init(format: requestURL, arguments: pathParamenters!)
        }
        
        let encoding: ParameterEncoding = JSONEncoding.default
        manager.request(requestURL, method: endpoint.method, parameters: parameters, encoding: encoding, headers: endpoint.headers)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        handler(.success(data))
                    }
                    
                case .failure(let error):
                    handler(.failure(error))
                    
                }
            })
        
    }
    
}
