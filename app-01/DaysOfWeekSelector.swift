//
//  DaysOfWeekSelector.swift
//  app-01
//
//  Created by Ramiro Uziel Rodriguez Pineda on 08/09/24.
//

import SwiftUI

struct DayOfWeekSelector: View {
    @Binding var selectedDays: [Int]
    
    private let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<7, id: \.self) { index in
                let dayValue = index + 1
                Button(action: {
                    if selectedDays.contains(dayValue) {
                        selectedDays.removeAll(where: { $0 == dayValue })
                    } else {
                        selectedDays.append(dayValue)
                    }
                }) {
                    Text(days[index])
                        .frame(width: 40, height: 40)
                        .background(selectedDays.contains(dayValue) ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.vertical, 10)
    }
}
