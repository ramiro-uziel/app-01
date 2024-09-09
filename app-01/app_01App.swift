//
//  app_01App.swift
//  app-01
//

import SwiftUI

@main
struct app_01App: App {
    
    @State var student: Student = Student.defaultValue
    @State var courses: Courses = Courses()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(student)
                .environment(courses)
        }
    }
}
