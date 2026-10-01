//
//  ExpenseRow.swift
//  Expense Tracker
//
//  Created by Isaac Luke on 9/30/26.
//

import SwiftUI

struct ExpenseRow: View {
    let emoji: String
    let title: String
    let amount: Double
    let color: Color
    let isBigTicket: Bool

    var body: some View {
        HStack {
            Text(emoji).font(.title)
            Text(title).font(.headline)
            Spacer()
            if isBigTicket { Text("💸") }
            Text("$\(amount, specifier: "%.2f")").bold()
        }
        .padding()
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

#Preview {
    ExpenseRow(emoji: "🍔", title: "Groceries", amount: 120, color: .orange, isBigTicket: true)
}
