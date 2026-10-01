//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Isaac Luke on 9/25/26.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ExpenseViewModel()

    var body: some View {
        ZStack {
            background
            VStack(spacing: 15) {
                summary
                warning
                expenseList
                addButtons
                budgetButtons
            }
            .padding()
        }
    }

    private var background: some View {
        LinearGradient(colors: [.indigo, .black],
                       startPoint: .top,
                       endPoint: .bottom)
            .ignoresSafeArea()
    }

    private var summary: some View {
        VStack {
            Text("Remaining").font(.headline)
            Text("$\(viewModel.remainingBudget, specifier: "%.2f")")
                .font(.system(size: 44))
                .bold()
            Text("Budget $\(viewModel.budget, specifier: "%.2f")")
            Text("Spent $\(viewModel.totalSpent, specifier: "%.2f")")
        }
        .foregroundStyle(.white)
    }

    private var warning: some View {
        Group {
            if viewModel.isOverBudget {
                Text("⚠️ Over Budget!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .background(.red)
                    .cornerRadius(12)
            }
        }
    }

    private var expenseList: some View {
        ScrollView {
            ForEach(viewModel.expenses) { expense in
                ExpenseRow(emoji: expense.category.emoji,
                           title: expense.title,
                           amount: expense.amount,
                           color: viewModel.color(for: expense.category),
                           isBigTicket: expense.isBigTicket)
                    .onTapGesture {
                        viewModel.removeExpense(expense)
                    }
            }
        }
    }

    private var addButtons: some View {
        HStack {
            Button("Coffee $4.50") {
                viewModel.addExpense(title: "Coffee", amount: 4.50, category: .food)
            }
            Button("Uber $18") {
                viewModel.addExpense(title: "Uber", amount: 18, category: .transportation)
            }
            Button("Movie $15") {
                viewModel.addExpense(title: "Movie", amount: 15, category: .entertainment)
            }
        }
        .buttonStyle(.borderedProminent)
    }

    private var budgetButtons: some View {
        HStack {
            Button("-$50") {
                viewModel.adjustBudget(by: -50)
            }
            Button("+$50") {
                viewModel.adjustBudget(by: 50)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
