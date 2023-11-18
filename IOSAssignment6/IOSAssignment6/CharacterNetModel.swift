//
//  CharacterNetModel.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import Foundation

//
//  CharacterNetModel.swift
//  Assignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import Foundation


struct Character : Hashable, Codable {
    let id: Int16
    let name: String
    let image: String
    let status: String
    let species: String
    let gender: String
    let location: Location
}

extension Character {
    static let example = Character(id: 1, name: "afdsa", image: "", status: "adsfasdf", species: "adsfasdf", gender: "adsfasdf", location: Location(name: "dadsf", url: ""))
}


struct Location: Hashable, Codable {
    let name: String
    let url: String
}

