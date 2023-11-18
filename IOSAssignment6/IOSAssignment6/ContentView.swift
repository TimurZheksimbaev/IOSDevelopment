//
//  ContentView.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager.shared
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)]) var characters: FetchedResults<CharacterData>
    
    
    var body: some View {
        
        
        NavigationView {

            List(characters, id: \.self) { character in
            

                NavigationLink(destination: CharacterDetailView(character: character, managedObjContext: _managedObjContext), label: {


                    ZStack {
                        AsyncImage(url: URL(string: character.image!)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .cornerRadius(4)
                                .blur(radius: 2)
                                .opacity(0.95)
                                .brightness(-0.25)
                            
                            
                        } placeholder: {
                            Rectangle()
                        }

                        Text(character.name!)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .brightness(100)
                            .padding(6)
                            .font(.callout)
                    }

                })


            }
            
            .navigationTitle("Characters")
//            .task {
//                do {
//                    for character in characters {
//                        managedObjContext.delete(character)
//                        try managedObjContext.save()
//                    }
//                } catch {
//                    print("error")
//                }
//            }
//            .task {
//                print(characters.count)
//                if characters.count == 0 {
//                    do {
//                        try await networkManager.getAllCharacters(context: managedObjContext)
//                    } catch netError.invalidData {
//                        print("Invalid data")
//                    } catch netError.invalidResponse {
//                        print("Invalid response")
//                    } catch netError.invalidURL {
//                        print("Invalid URL")
//                    } catch {
//                        print("Unknown error")
//                    }
//                } else {
//                    print("Data is already loaded")
//                }
//            }

        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
