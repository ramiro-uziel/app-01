import SwiftUI

struct StudentDetailView: View {
    @Bindable var student: Student
    
    var body: some View {
        Form {
            Section {
                AnimatedTextField(text: $student.name, placeholder: "Nombre")
                AnimatedTextField(text: $student.studentID, placeholder: "Matrícula")
                AnimatedTextField(text: $student.program, placeholder: "Programa")
            }
        }
        .navigationTitle("Detalles de alumno")
    }
}

#Preview {
    StudentDetailView(student: Student.defaultValue)
}
