//
//  CustomSegmentedView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 27/05/22.
//

import SwiftUI

struct CustomSegmentedView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Namespace var animation
    var body: some View {
        HStack(spacing: 0){
            ForEach([ExpenseType.income,ExpenseType.expense],id: \.rawValue){tab in
                Text(tab.rawValue)
                    .fontWeight(.semibold)
                    .foregroundColor(expenseViewModel.tabName == tab ? .white : .black)
                    .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                   
                    .background{
                        // Geomerty
                        if expenseViewModel.tabName == tab{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                
                                .fill(
                                    .linearGradient(colors:[
                                        Color("G4"),
                                        Color("G5"),
                                        Color("G5"),
                                        Color("G4"),
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
    //                                RoundedRectangle(cornerRadius: 10, style: .continuous)
    //                                .strokeBorder(.red)
                            
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                        
                    }
                    .contentShape(Rectangle())
                    .onTapGesture{
                        withAnimation{expenseViewModel.tabName = tab}
                    }
                
            }
        }
        .padding(5)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
}

struct CustomSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView()
    }
}

