import SwiftUI

struct ScheduleView: View {
    @StateObject var viewModel = CourseViewModel()
    @State private var createNewCourse: Bool = false
    @State var currentDate: Date = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    WeekHeaderView(viewModel: viewModel)
                        .frame(height: 89)
                    
                    ScrollView(.vertical) {
                        DayListView(date: $viewModel.currentDate)
                    }
                    .scrollIndicators(.hidden)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            createNewCourse = true
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.primary)
                        })
                        .sheet(isPresented: $createNewCourse) {
                            AddCourseView()
                                .presentationDetents([.height(880)])
                                .presentationBackground(.thinMaterial)
                        }
                    }
                }
            }
            .navigationTitle("Horario")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ScheduleView()
        .environment(Courses())
}
