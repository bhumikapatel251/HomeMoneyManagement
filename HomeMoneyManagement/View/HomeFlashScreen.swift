//
//  HomeFlashScreen.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI
// To use the custom font all screen
let customFont = "Raleway-Regular"
struct HomeFlashScreen: View {
    @State private var isActive = false
    @State private var size = 1.2
    @State private var opacity = 0.8
    var body: some View {
        NavigationView{
            if isActive{
               LoginScreen()
                    .navigationBarHidden(true)
            }else{
                VStack{
                    VStack(alignment:.trailing){
                        Image("Home2")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .trailing)
                            .font(.system(size: 80))
                        Text("HomeMoneyManagement")
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("BG1"))
                    
                        
                    }
                    .padding(.bottom,50)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 2.0
                            self.opacity = 2.8
                        }
                    }
                
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
       
        
            }
        }
        
    }
        
      
}

struct HomeFlashScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFlashScreen()
    }
}

//Extending view to get screen bounds...

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
