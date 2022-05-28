//
//  NewExpense.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 27/05/22.
//

import SwiftUI

struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    // environment value set for closed
    @Environment(\.self) var env
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 4){
                    Text("Add")
                        .font(.title2)
                        .fontWeight(.bold)
                        .opacity(0.7)
                        .frame(maxWidth: .infinity,  alignment: .leading)
                }
                .padding()
                .overlay(alignment: .topTrailing) {
                    Button{
                        env.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.black)
                                .opacity(0.7)
                        }
                        .padding()
                    
                    }
               
                }
                CustomSegmentedView()
                    .environmentObject(expenseViewModel)
                // Custom text Field
                    .padding()
                
          
                   
                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first{
            
                        TextField("0", text: $expenseViewModel.amount)
                            .font(.system(size: 18))
                            .foregroundColor(Color("G2"))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .background{
                                Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                    .font(.system(size: 18))
                                    .opacity(0)
                                    .overlay(alignment: .leading){
                                        Text(String(symbol))
                                            .opacity(0.6)
                                            .offset(x: -15, y: 1)
                                    }
                        
                            }
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                                //.frame( height: 2)
                            }
                            .padding(.horizontal,30)
                        //.padding(.top)
                
                
                    }
                
                // Remark
               
                Label {
                    TextField("Category", text: $expenseViewModel.category)
                        .padding(.leading,10)
                    
                } icon: {
                    Image(systemName: "doc.text.fill")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 25)
                
                 //DAte
                Label {
                    DatePicker.init("", selection: $expenseViewModel.date,in: Date.distantPast...Date(), displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,10)
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 25)
              
               
            }
            Label {
                TextField("Remark", text: $expenseViewModel.remark)
                    .padding(.leading,10)
                
            } icon: {
                Image(systemName: "note")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .background{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(.white)
            }
            .padding(.top, 25)
            .frame(maxWidth: .infinity, alignment: .center)
            
            //Save
            Button(action: {expenseViewModel.saveData(env: env)})
            { Text("Save")
                    .font(.title3)
                    .fontWeight((.semibold))
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(
                                .linearGradient(colors:[
                                    Color("G4"),
                                    Color("G5"),
                                    Color("G5"),
                                    Color("G4"),
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                
            }
            .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
            .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
            .padding(.vertical)
        }
        
        .padding()
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        
    }
   
}

struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense()
            .environmentObject(ExpenseViewModel())
    }
}
