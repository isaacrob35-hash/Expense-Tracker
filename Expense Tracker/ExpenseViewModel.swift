//
//  ExpenseViewModel.swift
//  Expense Tracker
//
//  Created by Isaac Luke on 9/25/26.
//

import SwiftUI

@Observable
class ExpenseViewModel {
    private(set) var expenses: [Expense] = [
        Expense(title: "Coffee", amount: 4.50, category: .food),
        Expense(title: "Groceries", amount: 120, category: .food),
        Expense(title: "Gas", amount: 45, category: .transportation),
        Expense(title: "Bus Pass", amount: 30, category: .transportation),
        Expense(title: "Movie", amount: 15, category: .entertainment)
    ]

    private(set) var budget: Double = 300 {
        didSet {
            if budget < 0 {
                budget = 0
            }
        }
    }

    var totalSpent: Double {
        var total = 0.0
        for expense in expenses {
            total += expense.amount
        }
        return total
    }

    var remainingBudget: Double {
        budget - totalSpent
    }

    var isOverBudget: Bool {
        totalSpent > budget
    }

    func adjustBudget(by amount: Double) {
        budget += amount
    }

    func addExpense(title: String, amount: Double, category: ExpenseCategory) {
        expenses.append(Expense(title: title, amount: amount, category: category))
    }

    func removeExpense(_ expense: Expense) {
        var kept: [Expense] = []
        for item in expenses {
            if item.id != expense.id {
                kept.append(item)
            }
        }
        expenses = kept
    }

    func color(for category: ExpenseCategory) -> Color {
        switch category {
            case .food: return .orange
            case .transportation: return .cyan
            case .entertainment: return .pink
        }
    }
}
