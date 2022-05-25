//
//  ExpenseViewModel.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI

class ExpenseViewModel: ObservableObject{
    //Properties
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    
    init(){
        //fetching current month starting date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month], from: Date())
        
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
    }
    //sample data of month
    //costmize core data
    @Published var expense:[Expense] = sample_expense
    
    // fetching current month date
    func currentMonthDateString()->String{
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " + Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    func convertExpenseToCurrency(expenses: [Expense], type:ExpenseType = .all)->String{
        var value: Double = 0
        value = expenses.reduce(0, {partialResult, expense in
            return partialResult + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        
        return convertNumberToPrice(value: value)
        
    }
    
    // converting number to price
    
    func convertNumberToPrice(value: Double)->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: .init(value: value)) ?? "$0.00"
    }
}

