//
//  DataController.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CharacterModel")
    let fetchRequest = NSFetchRequest<CharacterData>(entityName: "CharacterData")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func saveDataToCoreData(characters: [Character], context: NSManagedObjectContext) {
        
        for character in characters {
            let entity = CharacterData(context: context)
            entity.image = character.image
            entity.species = character.species
            entity.location = character.location.name
            entity.status = character.status
            entity.gender = character.gender
            entity.name  = character.name
        }
        
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveChanges(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }


    func changeStatus(character: CharacterData, status: String, context: NSManagedObjectContext) {
        character.status = status
        
        saveChanges(context: context)
    }

    func changeGender(character: CharacterData, gender: String, context: NSManagedObjectContext) {
        character.gender = gender
        
        saveChanges(context: context)
    }

    func changeLocation(character: CharacterData, location: Location, context: NSManagedObjectContext) {
        character.location = location.name
        
        saveChanges(context: context)
    }
    
}
