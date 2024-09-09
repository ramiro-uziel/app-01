import SwiftUI

struct CourseDetailView: View {
    
    @Environment(Courses.self) private var courses
    @Environment(\.dismiss) private var dismiss
    @State var course: Course
    @State private var selectedDays: [Days] = []
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        Form {
            Section() {
                AnimatedTextField(text: $course.course, placeholder: "Código")
                AnimatedTextField(text: $course.name, placeholder: "Nombre")
                    .lineLimit(5)
                
                Stepper(value: $course.semester, in: 1...10) {
                    Text("Semestre \($course.semester.wrappedValue)")
                }
                .padding(.vertical, 10)
                
                VStack(spacing: 10) {
                    DatePicker("Inicia", selection: $course.startDate, displayedComponents: .date)
                    DatePicker("Termina", selection: $course.endDate, displayedComponents: .date)
                }
                .padding(.vertical, 10)
                
                VStack(spacing: 10) {
                    Text("Hora de Inicio")
                    Stepper(value: $course.startHour, in: 0...23) {
                        Text("\(course.startHour):00")
                    }
                    
                    Text("Hora de Fin")
                    Stepper(value: $course.endHour, in: 0...23) {
                        Text("\(course.endHour):00")
                    }
                }
                .padding(.vertical, 10)
                
                VStack(spacing: 10) {
                    Text("Seleccionar Días")
                    DaysOfWeekPicker(selectedDays: $selectedDays)
                        .onAppear {
                            selectedDays = course.daysOfWeek.map { Days.allCases[$0 - 1] }
                        }
                        .onChange(of: selectedDays) { oldSelectedDays, newSelectedDays in
                            course.daysOfWeek = newSelectedDays.map { Days.allCases.firstIndex(of: $0)! + 1 }
                        }
                }
                .padding(.vertical, 10)
                
                Button {
                    if let index = courses.courses.firstIndex(where: { $0.id == course.id }) {
                        courses.courses[index] = course
                    }
                    dismiss()
                } label: {
                    Text("Guardar")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 10)
            }
            .navigationTitle("Detalles del Curso")
        }
    }
}

#Preview {
    CourseDetailView(course: Course.defaultValue)
        .environment(Courses())
}
