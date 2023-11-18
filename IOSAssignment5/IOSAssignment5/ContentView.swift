//
//  ContentView.swift
//  IOSAssignment5
//
//  Created by Тимур Жексимбаев on 09.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager.shared

    var body: some View {
        
        
        NavigationView {

            List(networkManager.allCharacters, id: \.self) { character in
            

                NavigationLink(destination: CharacterDetailView(character: character),
                    label: {


                    ZStack {
                        AsyncImage(url: URL(string: character.image)) { image in
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

                        Text(character.name)
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
            .task {
                do {
                    try await networkManager.getAllCharacters()
                } catch netError.invalidData {
                    print("Invalid data")
                } catch netError.invalidResponse {
                    print("Invalid response")
                } catch netError.invalidURL {
                    print("Invalid URL")
                } catch {
                    print("Unknown error")
                }
            }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

