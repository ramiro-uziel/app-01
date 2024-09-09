//
//  Days.swift
//  app-01
//

import SwiftUI

enum Days: String, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    

    var name: String {
        switch self {
        case .monday:
            return "Lunes"
        case .tuesday:
            return "Martes"
        case .wednesday:
            return "Miércoles"
        case .thursday:
            return "Jueves"
        case .friday:
            return "Viernes"
        }
    }

    var shortName: String {
        switch self {
        case .monday:
            return "Lun"
        case .tuesday:
            return "Mar"
        case .wednesday:
            return "Mié"
        case .thursday:
            return "Jue"
        case .friday:
            return "Vie"
        }
    }

    var number: Int {
        switch self {
        case .monday:
            return 1
        case .tuesday:
            return 2
        case .wednesday:
            return 3
        case .thursday:
            return 4
        case .friday:
            return 5
        }
    }

    
    var color: Color {
        switch self {
        case .monday:
            return Color.red
        case .tuesday:
            return Color.orange
        case .wednesday:
            return Color.yellow
        case .thursday:
            return Color.green
        case .friday:
            return Color.blue
        }
    }
    
}
