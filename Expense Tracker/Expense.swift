//
//  Expense.swift
//  Expense Tracker
//
//  Created by Isaac Luke on 9/25/26.
//

import Foundation

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let category: ExpenseCategory

    var isBigTicket: Bool {
        amount >= 100
    }
}
