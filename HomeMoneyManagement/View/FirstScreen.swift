//
//  FirstScreen.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI

struct FirstScreen: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 12){
                HStack(spacing:15){
                    VStack(alignment: .leading, spacing: 4){
                        Text("Welcome")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                            
                    }
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    NavigationLink{
                        filteredDetailView()
                            .environmentObject(expenseViewModel)
                    } label: {
                        Image(systemName: "book")
                            .foregroundColor(.gray)
//                                   .overlay(content: {
//                                       Circle()
//                                           .stroke(.white,lineWidth: 2)
//                                           .padding(7)
//                                   })
                            .frame(width: 30, height: 30)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            
             }
                    
                    Button{
                               
                    } label: {
                               Image(systemName: "magnifyingglass")
                                   .foregroundColor(.gray)
                                   
                                   .frame(width: 30, height: 30)
                                   .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                   .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                                   
                    }
                    Button{
                               
                    } label: {
                               Image(systemName: "slider.horizontal.3")
                                   .foregroundColor(.gray)
                                   .frame(width: 30, height: 30)
                                   .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                   .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }

                }
                ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:18){
                                ForEach(TaskType.allCases,id: \.self){type in
                                    TaskTypeView(type: type)
                                }
                            }
                            .padding(.horizontal, 25)
                        }
                        .padding(.top, 28)
                           
                    ExpenseCardView()
                    TransactionView()
                
            }
            .padding()
        }
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
    }
    //Transaction
    @ViewBuilder
    func TransactionView()->some View{
        VStack(spacing: 15){
            Text("Transaction")
                .font(.title2.bold())
                .opacity(0.7)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expense){expense in
                // Trasactioncard
                
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
        .padding(.top)
        
    }
        // expense cardview
    @ViewBuilder
    func ExpenseCardView()->some View{
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    Color("Gray")
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
                            .font(.system(size: 15, weight: .bold))
                            .lineLimit(1)
                            .padding(.bottom,5)
                    }
                    .padding(.leading,-1)
                }
                .padding(.horizontal,5)
                .padding(.trailing)
                .offset(y: 15)
            }
            //.foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 120)
        .padding(.top,05)
    }
    //Task
    @ViewBuilder
    func TaskTypeView(type: TaskType)->some View{
        Button {
                  
        }label: {
            Text(type.rawValue)
                .font(.system(size: 10))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        
        }
    }
    
}
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
