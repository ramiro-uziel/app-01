import SwiftUI

struct DayCourseItemView: View {
    var course: Course
    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .fill(Color.blue)
                .frame(width: 8, height: 8)
                .padding(.horizontal, 15)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(course.name)
                    .font(.headline)
                
                Label("\(course.startHour):00 - \(course.endHour):00", systemImage: "clock")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, maxHeight: 35, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
        .padding(.bottom, 25)
    }
}

#Preview {
    let sampleCourse = Course(
        course: "TC101",
        name: "Programming Basics",
        semester: 1,
        startDate: Date(),
        endDate: Date().addingTimeInterval(86400),
        startHour: 9,
        endHour: 11,
        daysOfWeek: [2, 4]
    )
    
    return DayCourseItemView(course: sampleCourse)
}
