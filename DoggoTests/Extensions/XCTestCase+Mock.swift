//
//  XCTestCase+Mock.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//


import Foundation
import XCTest
@testable import Doggo

extension XCTestCase {
    func loadDogMock() -> DoggoSearchModel.Dog {
        guard let url = Bundle.main.url(forResource: "Dog", withExtension: "json") else {
            XCTFail("Missing file: Dog.json")
            return DoggoSearchModel.Dog(id: nil, name: nil, breed_group: nil, temperament: nil, origin: nil, image: nil)
        }
        do {
            let data = try Data(contentsOf: url)
            let dog = try  JSONDecoder().decode(DoggoSearchModel.Dog.self, from: data)
            return dog
        }
        catch {
            XCTFail("Failed in parsing file with: \(error.localizedDescription)")
        }
        return DoggoSearchModel.Dog(id: nil, name: nil, breed_group: nil, temperament: nil, origin: nil, image: nil)
        
    }
    
    func loadDogList() -> DoggoSearchModel.ApiResponse {
        guard let url = Bundle.main.url(forResource: "DogList", withExtension: "json") else {
            XCTFail("Missing file: DogList.json")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let dogList = try  JSONDecoder().decode(DoggoSearchModel.ApiResponse.self, from: data)
            return dogList
        }
        catch {
            XCTFail("Failed in parsing file with: \(error.localizedDescription)")
        }
        return []
    }
}
