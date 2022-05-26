//
//  ExpenseCard.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 26/05/22.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors:[
                        Color("G4"),
                        Color("G5"),
                        Color("G5"),
                        Color("G4"),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                   
                )
            VStack(spacing: 15){
                VStack(spacing: 15){
                    //moth date starting
                    Text(expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top,05)
                    
                    //expenses prices
    //                    Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expense))
    //                        .font(.system(size: 15, weight: .bold))
    //                        .lineLimit(1)
    //                        .padding(.bottom,5)
                    
                    
                }
               // .offset(y: -10)
                
                
                HStack(spacing: 5){
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(Color("G2"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expense,type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            
                            .lineLimit(1)
                            .fixedSize()
                    }.padding(.leading,-1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(Color("Red"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                       
                    VStack(alignment: .leading, spacing: 2){
                        Text("Expenses")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expense,type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    } .padding(.leading,-1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "equal")
                        .font(.caption.bold())
                        .foregroundColor(Color("Blue"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("Total")
                            .font(.caption)
                            .opacity(0.7)
                        
                        //expenses prices
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expense))
                     
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .padding(.leading,-1)
                }
                .padding(.horizontal,1)
                .padding(.trailing)
                .offset(y: 15)
            }
            //.foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 120)
        .padding(.top,05)
    }
}
