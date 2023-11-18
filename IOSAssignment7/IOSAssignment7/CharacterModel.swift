//
//  CharacterModel.swift
//  IOSAssignment7
//
//  Created by Тимур Жексимбаев on 12.07.2023.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let status: String
    let species: String
    let gender: String
    let location: Location
}

extension Character {
    static let example = Character(id: 0, name: "Rick Sanchez", image: "", status: "Alive", species: "Human", gender: "Male", location: Location(name: "Earth", url: ""))
}

struct Location: Decodable {
    let name: String
    let url: String
}
