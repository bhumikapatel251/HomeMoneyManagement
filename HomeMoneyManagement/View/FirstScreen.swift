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
                      FilteringDetailView()
                            .environmentObject(expenseViewModel)
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                                   .overlay(content: {
                                       Circle()
                                           .stroke(.white,lineWidth: 2)
                                           .padding(7)
                                   })
                            .frame(width: 30, height: 30)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                    
//                    Button{
//
//                    } label: {
//                               Image(systemName: "magnifyingglass")
//                                   .foregroundColor(.gray)
//
//                                   .frame(width: 30, height: 30)
//                                   .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
//                                   .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
//
//                    }
                    Button{
                               
                    } label: {
                               Image(systemName: "slider.horizontal.3")
                                   .foregroundColor(.gray)
                                   .frame(width: 30, height: 30)
                                   .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                   .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }

                }
//                ScrollView(.horizontal, showsIndicators: false){
//                            HStack(spacing:18){
//                                ForEach(TaskType.allCases,id: \.self){type in
//                                    TaskTypeView(type: type)
//                                }
//                            }
//                            .padding(.horizontal, 25)
//                        }
                        .padding(.top, 28)
                           
                    ExpenseCard()
                    .environmentObject(expenseViewModel)
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
    
    //Task
//    @ViewBuilder
//    func TaskTypeView(type: TaskType)->some View{
//        Button {
//                  
//        }label: {
//            Text(type.rawValue)
//                .font(.system(size: 10))
//                .fontWeight(.semibold)
//                .foregroundColor(.gray)
//        
//        }
//    }
    
}
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
