//
//  AppBAr.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 09/07/22.
//

import SwiftUI

struct AppBAr: View {
    var body: some View {
        VStack {
            TopBar()
            Spacer()
        }
       
    }
}

struct AppBAr_Previews: PreviewProvider {
    static var previews: some View {
        AppBAr()
    }
}

struct TopBar: View{
    var body: some View{
        VStack(spacing: 20){
            
            HStack{
                
                Image("HomLogo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(y: -5)
                
            }
            .frame(width: 400, height: 10)
            .padding()
            .background(Color("HomColor"))
        }
        
    }
}
