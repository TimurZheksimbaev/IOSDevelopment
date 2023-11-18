//
//  NetworkManager.swift
//  IOSAssignment4
//
//  Created by Тимур Жексимбаев on 09.07.2023.
//

import Foundation

final class NetworkManager: ObservableObject {

    init() {}

    static let shared = NetworkManager()

    @Published var allCharacters = [Character]()
    
    public var loadedData = false

    func getAllCharacters() async throws -> Void  {

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

    }

}
