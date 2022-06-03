//
//  ContentView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI


struct ContentView: View {
    // Log Status
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        NavigationView{
            Group{
                if log_Status{
                    CircleTabBar()
                }else{
                    HomeFlashScreen()
                }
            }
            .navigationBarHidden(true)
        }
        
      
    }
      
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
