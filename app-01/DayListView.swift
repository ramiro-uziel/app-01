import SwiftUI

struct DayListView: View {
    @Binding var date: Date
    @Environment(Courses.self) private var courses
    @State private var selectedCourse: Course?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let filteredCourses = courses.courses
                    .filter { course in
                        let calendar = Calendar.current
                        let startDate = calendar.startOfDay(for: date)
                        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
                        return course.startDate <= startDate && course.endDate >= endOfDate
                    }
                    .sorted { $0.startHour < $1.startHour }
                
                ForEach(filteredCourses) { course in
                    DayCourseItemView(course: course)
                        .background(alignment: .leading) {
                            if filteredCourses.last?.id != course.id {
                                Rectangle()
                                    .frame(width: 1)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .offset(x: 35, y: 38)
                            }
                        }
                        .onTapGesture {
                            selectedCourse = course
                        }
                }
            }
            .padding(.top, 20)
        }
        .sheet(item: $selectedCourse) { course in
            CourseDetailView(course: course)
        }
    }
}

#Preview {
    DayListView(date: .constant(Date()))
        .environment(Courses())
}
