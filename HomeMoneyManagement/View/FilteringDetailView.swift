//
//  FilteringDetailView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 26/05/22.
//

import SwiftUI

struct FilteringDetailView: View {
    @EnvironmentObject var expenseViewModel : ExpenseViewModel
    
    // environment Value set for backButton
    @Environment(\.self) var env
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                HStack(spacing:15){
                    // Back Button
                    
                    Button{
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(.gray)
    //                               .overlay(content: {
    //                                   Circle()
    //                                       .stroke(.white,lineWidth: 2)
    //                                       .padding(7)
    //                               })
                            .frame(width: 30, height: 30)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                    VStack(alignment: .leading, spacing: 4){
                        Text("Transactions")
                            .font(.title)
                            .fontWeight(.bold)
                            .opacity(0.7)
                            .frame(maxWidth: .infinity,  alignment: .leading)
                            
                    }
                    // slider horizontal line symbol
                    Button{
                        expenseViewModel.showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                
                // Expense card view
               // ExpenseCard()
                  //  .environmentObject(expenseViewModel)
                CustomSegmentedControl1()
                    //.environmentObject(expenseViewModel)
                    .padding(.top)
                
                // filter date and amount
                VStack(spacing: 15){
                    Text(expenseViewModel.convertDateToString())
                        .opacity(0.7)
                    
                    Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expense, type: expenseViewModel.tabName))
                        .font(.title.bold())
                        .opacity(0.9)
                        .animation(.none, value: expenseViewModel.tabName)
                    
                }
                .padding()

                .frame(maxWidth:.infinity)
                .background{
                    RoundedRectangle(cornerRadius: 15, style:.continuous)
                        .fill(
                            .linearGradient(colors:[
                                Color("HomColor"),
                                Color("LPink"),
                                Color("LPink"),
                                Color("HomColor"),
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    
                }
                .padding(.vertical,20)
                
                ForEach(expenseViewModel.expense.filter{
                    return $0.type == expenseViewModel.tabName
                    
                }){expense in
                    TransactionCardView(expense: expense)
                        .environmentObject(expenseViewModel)
                }
                
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay{
            FilterView()
        }
    }
    //filterview
    
    @ViewBuilder
    func FilterView()->some View{
        ZStack{
            Color.black
                .opacity(expenseViewModel.showFilterView ? 0.25 : 0)
                .ignoresSafeArea()
            
            if expenseViewModel.showFilterView{
                VStack(alignment: .leading, spacing: 10){
                Text("Start Date")
                    .font(.caption)
                    .opacity(0.7)
                
                DatePicker("", selection: $expenseViewModel.startDate, in:Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                    
                    Text("End Date")
                        .font(.caption)
                        .opacity(0.7)
                        .padding(.top,10)
                    
                    DatePicker("", selection: $expenseViewModel.endDate, in:Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                }
                .padding(20)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                }
                // close
                .overlay(alignment: .topTrailing, content: {
                    Button{
                        expenseViewModel.showFilterView = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(5)
                    }
                })
                .padding()
            }
        }
        .animation(.easeInOut, value: expenseViewModel.showFilterView)
    }
    //Custom segmentation control
   @ViewBuilder
        func CustomSegmentedControl1()->some View{
            HStack(spacing: 0){
                ForEach([ExpenseType.income,ExpenseType.expense],id: \.rawValue){tab in
                    Text(tab.rawValue)
            .fontWeight(.semibold)
            .foregroundColor(expenseViewModel.tabName == tab ? .blue : .black)
            .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
           
            .background{
                // Geomerty
                if expenseViewModel.tabName == tab{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        
                        .fill(Color("BG"))
                           RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .strokeBorder(.blue)
                    
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
       .fill(Color("BG"))
//                .fill(
//                    .linearGradient(colors:[
//                        Color("HomColor"),
//                        Color("LPink"),
//                        Color("LPink"),
//                        Color("HomColor"),
//                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
//                )
        }
    }
}

struct FilteringDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringDetailView()
            .environmentObject(ExpenseViewModel())
    }
}
