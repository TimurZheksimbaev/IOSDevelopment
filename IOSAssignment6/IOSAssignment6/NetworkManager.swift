//
//  NetworkManager.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import Foundation
import CoreData

final class NetworkManager: ObservableObject{

    init() {}

    static let shared = NetworkManager()

    @Published var allCharacters = [Character]()
    
    public var loadedData = false


    func saveData(context: NSManagedObjectContext) {
        allCharacters.forEach { character in
            let entity = CharacterData(context: context)
            entity.id = character.id
            entity.status = character.status
            entity.name = character.name
            entity.gender = character.gender
            entity.species = character.species
            entity.image = character.image
            entity.location = character.location.name
        }

        do {
            try context.save()
            print("Characters from API are saved")
        } catch {
            print(error.localizedDescription)
        }
    }


    func getAllCharacters(context: NSManagedObjectContext) async throws -> Void  {

        for i in 1...20 {
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/" + String(i)) else {
                throw netError.invalidURL
            }

            let (data, response) = try await  URLSession.shared.data(from: url)

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw netError.invalidResponse
            }

            do {

                let character = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    self.allCharacters.append(character)
                }

            } catch {
                throw netError.invalidData
            }

        }
//        saveData(context: context)
        
        DataController().saveDataToCoreData(characters: self.allCharacters, context: context)

    }

}
