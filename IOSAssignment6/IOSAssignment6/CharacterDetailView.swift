//
//  CharacterDetailView.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import SwiftUI

struct CharacterDetailView: View {
    var character = CharacterData()
    
    @Environment(\.managedObjectContext) var managedObjContext

    @State var status: String = ""
    @State var gender: String = ""
    @State var location: String = ""

    var body: some View {


        List() {

            HStack {

                Spacer()
                AsyncImage(url: URL(string: character.image!)) {image in
                    image
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                }
                placeholder: {
                    Rectangle()
                }

                Spacer()
            }.listRowSeparator(.hidden)


            HStack {

                Spacer()

                Text(character.name!)
                    .fontWeight(.medium)
                    .font(.title2)
                    .fontDesign(.rounded)
                    

                Spacer()

            }.listRowSeparator(.hidden)
            
            
            HStack(spacing: 50) {

                
                Text("Status:")
                    .foregroundStyle(.secondary)
                    .font(.headline)
            
            
                TextField(character.status!, text: $status)
                    .fontWeight(.semibold)
                
            }
            .listRowSeparator(.hidden)
            .task {
                if status.count > 0 {
                    DataController().changeStatus(character: character, status: status, context: managedObjContext)
                }
            }
                
            


            HStack(spacing: 50) {
                
                
                Text("Species:").foregroundStyle(.secondary)
                    .font(.headline)
                
                
                
                Text(character.species!).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(0.5)
                
                
                
            }.listRowSeparator(.hidden)
            

            HStack(spacing: 50) {
                Text("Gender:").foregroundStyle(.secondary)
                    .font(.headline)
                    
                

                TextField(character.gender!, text: $gender)
                    .fontWeight(.semibold)
                
                
                    
            }.listRowSeparator(.hidden)

            HStack(spacing: 50) {

                Text("Location:").foregroundStyle(.secondary)
                    .font(.headline)

                if character.location! == "Earth (Replacement Dimension)" {
                    TextField("Earth", text: $location)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.7)

                } else {
                    TextField(character.location!, text: $location)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.7)

                }

            }.listRowSeparator(.hidden)
        }

    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
