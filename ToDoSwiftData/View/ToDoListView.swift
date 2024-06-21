//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import SwiftUI
import SwiftData

// ToDo detaylarının temel iskeleti
struct ToDoListView: View {
    
    let toDos : [ToDo]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let toDo = toDos[index]
                    context.delete(toDo)
                    
                    do {
                        try context.save()
                    }catch {
                        print(error)
                    }
                }
            })
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}

//#Preview {
//    ToDoListView(toDos: [ToDo(name: "test", priority: 123)]).modelContainer(for: [ToDo.self])
//    
//}
