//
//  Course.swift
//  app-01
//

import SwiftUI

struct Course: Identifiable, Hashable {
    
    var id: UUID = UUID()
    var course: String
    var name: String
    var semester: Int
    var startDate: Date
    var endDate: Date
    var startHour: Int
    var endHour: Int
    var daysOfWeek: [Int]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(course)
        hasher.combine(name)
        hasher.combine(semester)
        hasher.combine(startDate)
        hasher.combine(endDate)
        hasher.combine(startHour)
        hasher.combine(endHour)
        hasher.combine(daysOfWeek)
    }
    
}

extension Course {
    
    static var defaultValue = Course(
        course: "TC2007B",
        name: "Móviles",
        semester: 5,
        startDate: Date(),
        endDate: Date(),
        startHour: 9,
        endHour: 11,
        daysOfWeek: [2, 4]
    )
}
