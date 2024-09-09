import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CoursesView()
                .tabItem {
                    Label("Clases", systemImage: "book.fill")
                }
            
            ScheduleView()
                .tabItem {
                    Label("Horario", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environment(Courses())
        .environment(Student.defaultValue)
}
