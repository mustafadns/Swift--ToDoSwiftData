//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import Foundation
import SwiftData

// Yazılacak ToDo' nun temel iskeleti
@Model
final class ToDo {
    var name : String
    var priority : Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
