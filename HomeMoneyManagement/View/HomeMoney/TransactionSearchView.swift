//
//  TransactionSearchView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 14/07/22.
//

import SwiftUI

struct TransactionSearchView: View {
    @ObservedObject var expenseViewModel : ExpenseViewModel
    @State var isSearching = false
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.3156549894, green: 0.3207270241, blue: 0.327221803, alpha: 1)))
                    .cornerRadius(9)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    TextField("Search ...", text: $expenseViewModel.searched , onEditingChanged: { (isBegin) in
                        if isBegin {
                            isSearching = true
                        } else {
                            isSearching = false
                        }
                    }).keyboardType(.webSearch)
                    .foregroundColor(.black)
                    
                    if expenseViewModel.searched != "" {
                        Button(action: {
                            expenseViewModel.searched = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.5446127653, green: 0.5465545654, blue: 0.5666400194, alpha: 1)))
                        }
                        
                    }
                    
                    
                }
                .padding(.trailing , 8)
                .padding(.leading , 12)
                
            }.frame(width: 300, height: 38)
            .padding(.leading, 7)
            .padding(.top , 5)
           // .animation(.easeInOut(duration: 0.3))
          
            if isSearching {
                Button(action: {
                    hideKeyboard()
                }) {
                    Text("Cancel")
                }
            }
            
        }
    }
}

struct TransactionSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSearchView(expenseViewModel: ExpenseViewModel())
    }
}
