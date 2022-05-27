//
//  Expense.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI

struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var category: String
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
    
}
enum ExpenseType: String{
    case income = "Income"
    case expense = "Expense"
    case all = "All"
}
 
var sample_expense: [Expense] = [
    Expense(category: "Magic Keyboard", remark: "none", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(category: "Food", remark: "none", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "Red"),
    Expense(category: "Stock", remark: "none", amount: 159, date: Date(timeIntervalSince1970: 1652036845), type: .expense, color: "purple"),
    Expense(category: "Salary", remark: "none", amount: 15000, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "Blue"),
    Expense(category: "Cash", remark: "none", amount: 500, date: Date(timeIntervalSince1970: 1652814445), type: .income, color: "G4")
]
