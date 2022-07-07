//
//  INEXPickerView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 07/07/22.
//

import SwiftUI

struct INEXPickerView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    @State var isIncome = false
    var body: some View {
        NavigationView{
            ScrollView{
                Picker(selection: $isIncome, label: Text("Picker here")){
                    Text("Income")
                        .tag(true)
                    Text("Expense")
                        .tag(false)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
            }
            .navigationTitle("Expense")
            .overlay(alignment: .topTrailing) {
                Button{
                   env.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.black)
                            .opacity(0.7)
                    }
                    .padding(.top,-80)
                
                }
        }
       
    }
}

struct INEXPickerView_Previews: PreviewProvider {
    static var previews: some View {
        INEXPickerView()
    }
}
