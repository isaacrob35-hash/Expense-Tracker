//
//  ExpenseCategory.swift
//  Expense Tracker
//
//  Created by Isaac Luke on 9/25/26.
//

import Foundation

enum ExpenseCategory {
    case food, transportation, entertainment

    var emoji: String {
        switch self {
            case .food: return "☕"
            case .transportation: return "⛽"
            case .entertainment: return "🎥"
        }
    }
}
