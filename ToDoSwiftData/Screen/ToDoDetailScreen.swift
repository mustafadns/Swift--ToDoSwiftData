//
//  ToDoDetailScreen.swift
//  ToDoSwiftData
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import SwiftUI

// ToDo'ların Upload edilme sayfası
struct ToDoDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = ""
    @State private var priorty : Int?
    
    let toDo : ToDo
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priorty", value: $priorty , format: .number)
            Button("Update") {
                
                guard let priority = priorty else {return}
                
                toDo.name = name
                toDo.priority = priority
                
                do {
                    try context.save()
                }catch {
                    print(error)
                }
                dismiss()
            }
        }.onAppear(perform: {
            name = toDo.name
            priorty = toDo.priority
        })
    }
}

//#Preview {
//    ToDoDetailScreen()
//}
