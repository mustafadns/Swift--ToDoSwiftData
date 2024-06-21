//
//  ContentView.swift
//  ToDoSwiftData
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = ""
    @State private var priorty : Int?
    
    private var isFormValid : Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priorty != nil
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Priorty", value: $priorty , format: .number)
            }.navigationTitle("Add ToDo")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Dismiss")
                        })
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Dismiss action
                            guard let priorty = priorty else {return}
                            let toDo = ToDo(name: name, priority: priorty)
                            context.insert(toDo)
                            
                            do {
                                try context.save()
                            }catch {
                                print(error.localizedDescription)
                            }
                            dismiss()
                            
                        }, label: {
                            Text("Save")
                        }).disabled(!isFormValid)
                    }
                }
        }
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
