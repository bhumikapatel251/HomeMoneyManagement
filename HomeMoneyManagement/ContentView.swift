//
//  ContentView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI


struct ContentView: View {
    // Log Status
   // @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
//      //  NavigationView{
//            Group{
//                if log_Status{
//                    CircleTabBar()
//                }else{
//                    HomeFlashScreen()
//                }
//            }
//            .navigationBarHidden(true)
//        }
        NavigationView{
            AnimatedSplashScreen(color: "HomColor", logo: "HomeMoneyLogo"){
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(1...5, id: \.self){index in
                            GeometryReader{proxy in
                                let size = proxy.size
                                Image("Thumb\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: size.width, height: size.height)
                                    .cornerRadius(15)
                            }
                            .frame(height: 200)
                        }
                    }
                    .padding(15)
                }
              //  CircleTabBar()
            } onAnimationEnd: {
                print("Animaton Ended")
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
