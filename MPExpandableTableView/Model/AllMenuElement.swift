//
//  AllMenuElement.swift
//  MakeMyApp
//
//  Created by Musavir on 22/06/19.
//  Copyright © 2019 Musavir. All rights reserved.
//
import Foundation

// MARK: - AllMenuElement
class Menu: Codable {
    let name: String
    let subCategory: [SubCategory]
    var open = false

    enum CodingKeys: String, CodingKey {
        case name
        case subCategory = "sub_category"
    }
    
    init(name: String, subCategory: [SubCategory]) {
        self.name = name
        self.subCategory = subCategory
    }
}

// MARK: - SubCategory
class SubCategory: Codable {
    let name, displayName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
    }
    
    init(name: String, displayName: String) {
        self.name = name
        self.displayName = displayName
    }
}

typealias AllMenu = [Menu]
