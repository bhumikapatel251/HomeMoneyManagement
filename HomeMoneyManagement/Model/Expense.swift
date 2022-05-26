//
//  Expense.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI

struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
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
    Expense(remark: "Magic Keyboard", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "Red"),
    Expense(remark: "Stock", amount: 159, date: Date(timeIntervalSince1970: 1652036845), type: .expense, color: "purple"),
    Expense(remark: "Salary", amount: 15000, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "Blue"),
    Expense(remark: "Cash", amount: 500, date: Date(timeIntervalSince1970: 1652814445), type: .income, color: "G4")
]
