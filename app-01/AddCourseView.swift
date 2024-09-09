//
//  AddCourseView.swift
//  app-01
//

import SwiftUI
struct DaysOfWeekPicker: View {
    
    @Binding var selectedDays: [Days]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(Days.allCases, id: \.self) { day in
                    Text(day.shortName)
                        .font(.headline)
                        .frame(width: 55, height: 40)
                        .background(selectedDays.contains(day) ? Color.accentColor.cornerRadius(10) : Color.gray.cornerRadius(10))
                        .foregroundColor(.white)
                        .onTapGesture {
                            if selectedDays.contains(day) {
                                selectedDays.removeAll(where: { $0 == day })
                            } else {
                                selectedDays.append(day)
                            }
                        }
                }
                Spacer()
            }
        }
    }
}

struct AddCourseView: View {
    
    @Environment(Courses.self) var courses
    @Environment(\.dismiss) var dismiss
    
    @State private var courseName: String = ""
    @State private var courseCode: String = ""
    @State private var semester: Int = 1
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startHour: Int = 9
    @State private var endHour: Int = 11
    @State private var selectedDays: [Days] = []
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    AnimatedTextField(text: $courseCode, placeholder: "Código")
                    AnimatedTextField(text: $courseName, placeholder: "Nombre")
                    
                    Stepper(value: $semester, in: 1...10) {
                        Text("Semestre \(semester)")
                    }
                    .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        DatePicker("Inicia", selection: $startDate, displayedComponents: .date)
                        DatePicker("Termina", selection: $endDate, displayedComponents: .date)
                    }
                    .padding(.vertical, 10)
                    
                    VStack(spacing: 10) {
                        Text("Hora de Inicio")
                        Stepper(value: $startHour, in: 0...23) {
                            Text("\(startHour):00")
                        }
                        
                        Text("Hora de Fin")
                        Stepper(value: $endHour, in: 0...23) {
                            Text("\(endHour):00")
                        }
                    }
                    .padding(.vertical, 10)
                    
                    DaysOfWeekPicker(selectedDays: $selectedDays)
                        .padding(.vertical, 10)
                
                    Button {
                        saveCourse()
                        dismiss()
                    } label: {
                        Text("Guardar")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 10)
                }
            }
            .navigationBarItems(leading: Button("Cancelar") {
                dismiss()
            })
        }
    }
    
    func saveCourse() {
        let daysOfWeek = selectedDays.map { day in
            Days.allCases.firstIndex(of: day)! + 1
        }
        
        let newCourse = Course(course: courseCode, name: courseName, semester: semester, startDate: startDate, endDate: endDate, startHour: startHour, endHour: endHour, daysOfWeek: daysOfWeek)
        courses.courses.append(newCourse)
    }
}

#Preview {
    AddCourseView()
        .environment(Courses())
}
