//
//  TaskMainView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 09/07/22.
//

import SwiftUI

struct TaskMainView: View {
    @StateObject var taskVM = TaskViewModel()
    
    @State var searched = ""
    var body: some View {
        NavigationView{
            VStack{
                
                VStack{
                    TaskSearchView(taskVM: taskVM)
                    SortPickerView(taskVM : taskVM)
                    TaskListView(taskVM : taskVM)
                    }
                .modifier(MainViewModifier(taskVM : taskVM))
                .background(Color("BG"))
            }
            .background(Color("BG"))
        }
        .navigationBarHidden(true)
    }
       
}

struct TaskMainView_Previews: PreviewProvider {
    static var previews: some View {
        TaskMainView()
    }
}
