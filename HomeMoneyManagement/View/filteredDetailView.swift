//
//  FilteredDetailView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI

struct FilteredDetailView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
                
        }
        .navigationBarHidden(true)
        .background{
            Color("LightBlack")
                .ignoresSafeArea()
        }
    }
}

struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
