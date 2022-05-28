//
//  TransactionCardView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        HStack(spacing: 12){
            // first latter avtar
            if let first = expense.category.first{
                Text(String(first))
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width:50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            VStack(alignment: .trailing, spacing: 7){
            Text(expense.category)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(expense.remark)
                .foregroundColor(.black)
                .font(.caption)
                .opacity(0.5)
            }
            
            
            VStack(alignment: .trailing, spacing: 7){
                // display price
                let price = expenseViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .expense ? Color("Red") : Color("G2"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .foregroundColor(.black)
                    .font(.caption)
                    .opacity(0.5)
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
            
        }
        
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
