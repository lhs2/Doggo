//
//  Reachability.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Alamofire

final class Reachability {
    static let shared: Reachability = Reachability()
    private let reachability = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    private (set) var isReachable: Bool = true 

    func startNetworkReachabilityObserver() {
        reachability?.startListening() { [weak self] status in
            switch status {
            case .notReachable, .unknown:
                self?.isReachable = false
            case .reachable(.ethernetOrWiFi), .reachable(.cellular):
                self?.isReachable = true
            }
        }
   }
    
}
