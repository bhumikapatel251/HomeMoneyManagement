//
//  TransactionList.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 12/07/22.
//

//import SwiftUI
//
//struct TransactionList: View {
//    @ObservedObject var expenseViewModel : ExpenseViewModel
//    var body: some View {
//        List {
//            ForEach(expenseViewModel.expense){expense in
//            // Trasactioncard
//            
//                TransactionCardView(expense: expense)
//                    .environmentObject(expenseViewModel)
//            }
//            .onDelete(perform: {
//                expenseViewModel.removeExpense(indexAt: $0)
//            })
//           
//        }.listStyle(InsetListStyle())
//    }
//}
//
//struct TransactionList_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionList(expenseViewModel: ExpenseViewModel())
//    }
//}
