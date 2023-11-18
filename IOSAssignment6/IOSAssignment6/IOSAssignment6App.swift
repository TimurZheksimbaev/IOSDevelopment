//
//  IOSAssignment6App.swift
//  IOSAssignment6
//
//  Created by Тимур Жексимбаев on 07.07.2023.
//

import SwiftUI

@main
struct IOSAssignment6App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
