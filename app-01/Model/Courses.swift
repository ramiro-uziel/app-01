//
//  Courses.swift
//  app-01
//

import SwiftUI

@Observable class Courses {
    
    var courses: [Course] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let calendar = Calendar.current
        
        let startDate1 = Date()
        let endDate1 = calendar.date(byAdding: .day, value: 7, to: startDate1)!
        courses.append(
            Course(course: "TC2007B", name: "Desarrollo de aplicaciones móviles", semester: 5, startDate: startDate1, endDate: endDate1, startHour: 9, endHour: 11, daysOfWeek: [2, 4]))
        
        let startDate2 = Date()
        let endDate2 = calendar.date(byAdding: .day, value: 7, to: startDate2)!
        courses.append(
            Course(course: "TC2038", name: "Algoritmos Avanzados", semester: 5, startDate: startDate2, endDate: endDate2, startHour: 14, endHour: 16, daysOfWeek: [3, 5]))
    }
    
    func sortedCourses(by date: Date) -> [Course] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        
        return courses.filter { $0.startDate <= startDate && $0.endDate >= endOfDate }
            .sorted { $0.startHour < $1.startHour }
    }
}
