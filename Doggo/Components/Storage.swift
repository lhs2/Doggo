//
//  Storage.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
import Cache

final class StorageManager {
    static let shared: StorageManager = StorageManager()
    
    private var storage: Storage<String, Data>?
    
    init() {
        let diskConfig = DiskConfig(name: "Floppy")
        let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)

        storage = try? Storage( diskConfig: diskConfig, memoryConfig: memoryConfig, transformer: TransformerFactory.forCodable(ofType: Data.self)
        )
    }
    
    func set(for id: String, data: Data) {
        storage?.async.setObject(data, forKey: id) { result in
          switch result {
            case .value:
              print("id \(id): saved successfully")
            case .error(let error):
              print(error)
          }
        }
    }
    
    func get(for id: String) -> Data? {
        do {
            let data = try storage?.object(forKey: id)
            return data
        } catch {
            return nil
        }
    }
    
    
}
