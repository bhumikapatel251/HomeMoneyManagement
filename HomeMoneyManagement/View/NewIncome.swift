//
//  NewIncome.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 02/06/22.
//

import SwiftUI

struct NewIncome: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.presentationMode) var presentationMode
    
    // environment value set for closed
    @Environment(\.self) var env
    @State var isIncome = false
    @State var category = ""
    @State var remark = ""
    @State var date = Date()
    @Namespace var animation
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")) {
                    TextField("Category ", text : $expenseViewModel.category)
                    TextField("Remark ", text : $expenseViewModel.remark)
                }
                
                
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section(header: Text("Selection")){
                    Picker(selection: $isIncome, label: Text("Picker here")){
                        Text("Expense")
                            .tag(true)
                        Text("Income")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount")){
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
                    }
                }
                
                
            }
//            ScrollView(.vertical, showsIndicators: false){
//            VStack(spacing: 15){
//            HStack(spacing: 15){
////                VStack(alignment: .leading, spacing: 4){
////
////                }
//               // .padding()
//
////                    Button{
////                        env.dismiss()
////                        } label: {
////                            Image(systemName: "xmark")
////                                .font(.title2)
////                                .foregroundColor(.black)
////                                .opacity(0.7)
////                        }
////                        .padding()
//
//                    }
//
//
//                VStack{
//                    Picker(selection: $isIncome, label: Text("Picker here")){
//                        Text("Expense")
//                            .tag(true)
//                        Text("Income")
//                            .tag(false)
//                    }.pickerStyle(SegmentedPickerStyle())
//                        //.foregroundColor($isIncome ? Color.blue : .red)
//                        .padding()
//
////                    .contentShape(Rectangle())
////                    .onTapGesture{
////                        withAnimation(animation)
////                    }
//                    }
//                .frame(width: 350, height: 60)
//
//
////                CustomSegmentedView()
////                    .environmentObject(expenseViewModel)
//                // Custom text Field
//                    .padding()
//
//
//
//                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first{
//
//                        TextField("0", text: $expenseViewModel.amount)
//                            .font(.system(size: 18))
//                            .foregroundColor(Color("G2"))
//                            .multilineTextAlignment(.center)
//                            .keyboardType(.numberPad)
//                            .background{
//                                Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
//                                    .font(.system(size: 18))
//                                    .opacity(0)
//                                    .overlay(alignment: .leading){
//                                        Text(String(symbol))
//                                            .opacity(0.6)
//                                            .offset(x: -15, y: 1)
//                                    }
//
//                            }
//                            .padding(.vertical,15)
//                            .frame(maxWidth: .infinity)
//                            .background{
//                                RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                    .fill(.white)
//                                //.frame( height: 2)
//                            }
//                            .padding(.horizontal,30)
//                        //.padding(.top)
//
//
//                    }
//
//
////                // Category
////
////                Label {
////                    TextField("Category", text: $expenseViewModel.category)
////                        .padding(.leading,10)
////
////                } icon: {
////                    Image(systemName: "doc.text.fill")
////                        .font(.title3)
////                        .foregroundColor(.gray)
////                }
////                .padding(.vertical, 20)
////                .padding(.horizontal, 30)
////                .background{
////                    RoundedRectangle(cornerRadius: 12, style: .continuous)
////                        .fill(.white)
//               }
////                .padding(.top, 25)
////                .padding(.horizontal,10)
////
////                 //DAte
////                Label {
////                    DatePicker.init("", selection: $expenseViewModel.date,in: Date.distantPast...Date(), displayedComponents: [.date])
////                        .datePickerStyle(.compact)
////                        .labelsHidden()
////                        .frame(maxWidth: .infinity, alignment: .leading)
////                        .padding(.leading,10)
////                } icon: {
////                    Image(systemName: "calendar")
////                        .font(.title3)
////                        .foregroundColor(.gray)
////                }
////                .padding(.vertical, 15)
////                .padding(.horizontal, 30)
////                .background{
////                    RoundedRectangle(cornerRadius: 12, style: .continuous)
////                        .fill(.white)
////                }
////                .padding(.top, 25)
////                .padding(.horizontal,10)
////
////
////            }
////            Label {
////                TextField("Remark", text: $expenseViewModel.remark)
////                    .padding(.leading,10)
////
////            } icon: {
////                Image(systemName: "note")
////                    .font(.title3)
////                    .foregroundColor(.gray)
////            }
////            .padding(.vertical, 20)
////            .padding(.horizontal, 30)
////            .background{
////                RoundedRectangle(cornerRadius: 12, style: .continuous)
////                    .fill(.white)
////            }
////            .padding(.top, 25)
////            .padding(.horizontal,10)
////            .frame(maxWidth: .infinity, alignment: .center)
//
//            //Save
//            Button(action: {
//                expenseViewModel.saveData(env: env)
//
//            })
//            { Text("Save")
//                    .font(.title3)
//                    .fontWeight((.semibold))
//                    .padding(.vertical, 15)
//                    .frame(maxWidth: .infinity)
//                    .background{
//                        RoundedRectangle(cornerRadius: 12, style: .continuous)
//                            .fill(
//                                .linearGradient(colors:[
//                                    Color("HomColor"),
//                                    Color("LPink"),
//                                    Color("LPink"),
//                                    Color("HomColor"),
//                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
//                            )
//                    }
//                    .foregroundColor(.white)
//                    .padding(.bottom,10)
//
//            }
//            .padding(.horizontal,10)
////            .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
////            .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
//            .padding(.vertical)
//        }
            .navigationTitle(isIncome ? "Add Expense"  : "Add Income")
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                                leading: Button(action:{
                                                presentationMode.wrappedValue.dismiss() },
                                                label : {
                                                    Text("Cancel")
                                                    .foregroundColor(.red)
                                                }),
                                trailing: Button(action:{
                                    expenseViewModel.saveData(env: env)
                                    //taskVM.addTask(task: .init(name: name, taskName: taskName, date: date, priority: priority))
                                                    presentationMode.wrappedValue.dismiss()},
                                                   label:{
                                                    Text("Save")
                                                   })
//                                .disabled($expenseViewModel.category.isEmpty || $expenseViewModel.remark.isEmpty)
            )
            .background{
                Color("BG")
                    .ignoresSafeArea()
            }
            
        }
        //.padding()
       
    }
}

struct NewIncome_Previews: PreviewProvider {
    static var previews: some View {
        NewIncome()
            .environmentObject(ExpenseViewModel())
    }
}
