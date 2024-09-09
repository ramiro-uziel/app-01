//
//  ContentView.swift
//  app-01

import SwiftUI

struct CoursesView: View {
    
    @Environment(Student.self) private var student
    @Environment(Courses.self) private var courses
    @State var showEditView: Bool = false
    @State var showAddCourseView: Bool = false
    @State private var isEditing: Bool = false
    
    func formattedDateRange(startDate: Date, endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        let formattedStartDate = dateFormatter.string(from: startDate)
        let formattedEndDate = dateFormatter.string(from: endDate)
        return "\(formattedStartDate) - \(formattedEndDate)"
    }
    
    func deleteCourse(at offsets: IndexSet) {
        courses.courses.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .leading, endPoint: .trailing)
                
                VStack {
                    HStack {
                        VStack {
                            Text(student.name.split(separator: " ").first ?? "")
                                .font(.system(size: 32))
                                .fontWeight(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(student.studentID)
                                .font(.system(size: 16))
                                .fontDesign(.monospaced)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Text(student.program)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 30)
                    
                    List {
                        Section {
                            HStack {
                                Button(action: {
                                    showAddCourseView = true
                                }) {
                                    Label("Agregar", systemImage: "plus")
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .buttonStyle(BorderlessButtonStyle())
                                }
                                
                                Spacer()
                                
                                EditButton()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .buttonStyle(BorderlessButtonStyle())
                            }
                            .padding(.vertical, 8)
                        }
                        
                        ForEach(courses.courses) { course in
                            NavigationLink(value: course) {
                                VStack {
                                    VStack {
                                        Spacer()
                                        Text(course.name)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(course.course)
                                            .fontDesign(.monospaced)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        Text("Semestre \(course.semester)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text(formattedDateRange(startDate: course.startDate, endDate: course.endDate))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteCourse)
                    }
                    .listStyle(.inset)
                    .padding(.top, -7)
                }
            }
            .navigationTitle("Clases")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: student) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showAddCourseView) {
                AddCourseView(courses: _courses)
            }
            .navigationDestination(for: Student.self) { student in
                StudentDetailView(student: student)
            }
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course)
            }
        }
    }
}

#Preview {
    CoursesView()
        .environment(Student.defaultValue)
        .environment(Courses())
}
