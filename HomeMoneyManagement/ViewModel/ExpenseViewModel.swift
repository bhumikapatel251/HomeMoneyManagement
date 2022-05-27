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
    
    // Expense/Income tabView
    @Published var tabName: ExpenseType = .expense
    
    // filterview
    @Published var showFilterView: Bool = false
    
    //new expense properties
    @Published var addNewExpense: Bool = false
    @Published var amount : String = ""
    @Published var type : ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""
    @Published var category: String = ""
    
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
    // converting selected date to string
    func convertDateToString()->String{
        return startDate.formatted(date: .abbreviated, time: .omitted) + " - " + endDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    // converting number to price
    
    func convertNumberToPrice(value: Double)->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: .init(value: value)) ?? "$0.00"
    }
    // clearing all data
    func clearData(){
        date = Date()
        type = .all
        remark = ""
        amount = ""
        category = ""
    }
    // Save data
    func saveData(env: EnvironmentValues){
        // do action
        print("Save")
        
        let amountInDouble = (amount as NSString).doubleValue
        let colors = ["Yellow", "Red", "Purple", "G2"]
        let expense = Expense(category: category, remark: remark, amount: amountInDouble, date: date, type: type, color: colors.randomElement() ?? "Yellow")
//        withAnimation{expense.append(expense)}
//        expense = expense.sorted(by: { first, scnd in
//            return scnd.date < first.date
//        })
//        env.dismiss()
    }
    
}

