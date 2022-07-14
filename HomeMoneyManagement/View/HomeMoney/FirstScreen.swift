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
                    NavigationLink{
                        //TaskMainView()//.environmentObject(TaskViewModel())
                    } label: {
                               Image(systemName: "waveform.path.ecg")
                                   .foregroundColor(.black)
                                   .frame(width: 30, height: 30)
                                   .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                   .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }

                }
                .padding()
                TransactionSearchView(expenseViewModel: expenseViewModel)
//                ScrollView(.horizontal, showsIndicators: false){
//                            HStack(spacing:18){
//                                ForEach(TaskType.allCases,id: \.self){type in
//                                    TaskTypeView(type: type)
//                                }
//                            }
//                            .padding(.horizontal, 25)
//                        }
                        .padding(.top,-10)
                        .padding(.horizontal,-14)
                           
                    ExpenseCard()
                    .environmentObject(expenseViewModel)
                
//                Text("Transaction")
//                    .font(.title2.bold())
//                    .opacity(0.7)
//                    .frame(maxWidth: .infinity,alignment: .leading)
//                    .padding(.bottom,1)
                VStack{
                   // ScrollView(.vertical, showsIndicators: false){
                        TransactionView()
                        //TransactionList(expenseViewModel: ExpenseViewModel())
                  //  }
                    //.background(Color.white)
                }
                .padding(.horizontal, -10)
            }
            .padding(.leading,10)
            .padding(.trailing,10)
        
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $expenseViewModel.addNewExpense) {
            expenseViewModel.clearData()
        } content: {
            NewExpense()
                .environmentObject(expenseViewModel)
        }
        .overlay(alignment: .bottomTrailing){
        AddButton()
        }
    }
    // add new button
    @ViewBuilder
    func AddButton()->some View{
        Button{
            expenseViewModel.addNewExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background{
                    Circle()
                        .fill(
                            .linearGradient(colors:[
                                Color("HomColor"),
                                Color("HomColor"),
                                Color("LPink"),
                                Color("LPink"),
                                Color("HomColor"),
                                Color("HomColor"),
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                           
                        )
                }
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        }
        .padding()
    }
    //Transaction
    @ViewBuilder
    func TransactionView()->some View{
        VStack(spacing: 15){
            List {
                  Section(
                       header: Text("Transaction")){
                           ForEach(expenseViewModel.expense.filter {
                               self.expenseViewModel.searched.isEmpty ? true : $0.remark.localizedCapitalized.contains(self.expenseViewModel.searched)
                           }){expense in
                                // Trasactioncard
                
                            TransactionCardView(expense: expense)
                                .environmentObject(expenseViewModel)
                      }
                      .onDelete(perform: {
                           expenseViewModel.removeExpense(indexAt: $0)
                   })
               }
            }
            
            .listStyle(InsetListStyle())
                
//                ForEach(expenseViewModel.expense){expense in
//                // Trasactioncard
//
//                    TransactionCardView(expense: expense)
//                        .environmentObject(expenseViewModel)
//                }
//                .onDelete(perform: {
//                    expenseViewModel.removeExpense(indexAt: $0)
//                })
                
        }
        .accentColor(.blue)
        .padding(.top,-1)
        .padding(.horizontal,-10)

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
