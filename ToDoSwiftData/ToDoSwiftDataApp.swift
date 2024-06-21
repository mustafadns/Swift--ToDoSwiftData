//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import SwiftUI

@main
struct ToDoSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
