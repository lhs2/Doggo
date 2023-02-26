//
//  Constraints.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import Foundation
// API Constraints
typealias Text = Constraints

let baseURL = "https://api.thedogapi.com/v1/"
let API_KEY = "MHsZ52zZffWPFlIs8xkKGOiYQpw66O86"

struct Constraints {
    static let coderNotImplemented = "init(coder:) has not been implemented"

    static let optionsMenuTitle = "Launches filter"
    static let optionsMenuAsc = "Show only sucessfully launches"
    static let optionsMenuCheckboxLabel = "Change layout to grid?"
    static let optionsMenuConfirmButton = "Update options"
    
}

