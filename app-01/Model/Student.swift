//
//  Student.swift
//  app-01
//

import SwiftUI

@Observable class Student : Hashable {
    
    var studentID: String
    var name: String
    var program: String
    
    init(studentID: String, name: String, program: String) {
        self.studentID = studentID
        self.name = name
        self.program = program
    }
    
     static func == (lhs: Student, rhs: Student) -> Bool {
         return lhs.studentID == rhs.studentID && lhs.name == rhs.name && lhs.program == rhs.program
     }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(studentID)
        hasher.combine(name)
        hasher.combine(program)
    }
    
}

extension Student {
    
    static var defaultValue: Student = Student(studentID: "A01285574", name: "Ramiro Uziel Rodríguez Pineda", program: "ITC")
    
}
