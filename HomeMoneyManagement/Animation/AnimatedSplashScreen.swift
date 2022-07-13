//
//  AnimatedSplashScreen.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 05/07/22.
//

import SwiftUI

// MARK: Custom view Builder
struct AnimatedSplashScreen<Content: View>: View {
    var content: Content
    @AppStorage("log_Status") var log_Status: Bool = false
    //MARK: Properties
    var color: String
    var logo: String
    var barHeight: CGFloat = 40
    var animationTiming: Double = 0.65
    var onAnimationEnd: ()->()
    init(color: String, logo: String, barHeight: CGFloat = 40, animationTiming: Double = 0.65, @ViewBuilder content: @escaping()->Content, onAnimationEnd: @escaping ()->()){
        self.content = content()
        self.onAnimationEnd = onAnimationEnd
        self.color = color
        self.logo = logo
        self.barHeight = barHeight
        self.animationTiming = animationTiming
        
    }
    //MARK: Animation Properties
    @State var startAnimation: Bool = false
    @State var animateContent: Bool = false
    @Namespace var animation
   // @StateObject var expenseViewModel: ExpenseViewModel = .init()
    @State var index = 0
    
    var body: some View {
        VStack(spacing:0){
            if startAnimation{
                GeometryReader{proxy in
                    let size = proxy.size
                    VStack(spacing: 0){
                        ZStack(alignment: .bottom){
                            Rectangle()
                            
                                .fill(Color("HomColor"))
                                .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                                .frame(height: barHeight + safeArea().top)
                                
                            Image("HomLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: "SPLASHICON", in: animation)
                                .frame(width: 45, height: 45)
                                .padding(.bottom,5)
                               
                        }
                        //tabbar display
                        VStack(spacing : 0){
                            
                            ZStack{
                                if self.index == 0 {
                                    Color.black.opacity(0.05)
                                    FirstScreen()
                                    
                                } else if self.index == 1{
                                    Color.yellow
                                    
                                }else if self.index == 2{
                                    TaskMainView()
                                }else {
                                    Color.orange
                                }
                            }
                            
                            CircleTab(index: self.$index)
                        }
                        .edgesIgnoringSafeArea(.top)
                        // effect upside
                    .offset(y: animateContent ? 0 : size.height)
               
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .transition(.identity)
                .ignoresSafeArea(.container, edges: .all)
                .onAppear{
                    if !animateContent{
                        withAnimation(.easeInOut(duration: animationTiming)){
                            animateContent = true
                        }
                    }
                }
            }else {
                ZStack{
                    Rectangle()
                    
                        .fill(Color("HomColor"))
                        .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                    Image("HomeLogo")
                        .matchedGeometryEffect(id: "SPLASHICON", in: animation)
                }
                .ignoresSafeArea(.container,edges: .all)
            }
        }
        .onAppear{
            if !startAnimation{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                    withAnimation(.easeOut(duration: animationTiming)){
                        startAnimation = true
                    }
                }
            }
        }
    }

}

struct AnimatedSplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CircleTab : View {
    
    @Binding var index :Int
    
    var body: some View {
        
        HStack{
            Button(action: {
                self.index = 0
               
                
            }) {
                VStack{
                    
                    if self.index != 0{
                        
                        Image("Trans")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.7))
                    } else {
                        Image("Trans")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .padding()
                            .background{
                                Circle()
                                    .fill(
                                        .linearGradient(colors:[
                                            Color("HomColor"),
                                            Color("LPink"),
                                            Color("LPink"),
                                            Color("HomColor"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -10)
                        
                        Text("Trans.").foregroundColor(Color.black.opacity(0.7))
                            .offset(y: -20)
                           
                    }
                }
                
                    
                    
            }
            Spacer(minLength: 1)
            
            Button(action: {
                
                self.index = 1
                
            }) {
                VStack{
                    
                    if self.index != 1{
                        
                        Image("Chart")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.7))
                    } else {
                        Image("Chart")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .padding()
                            .background{
                                Circle()
                                    .fill(
                                        .linearGradient(colors:[
                                            Color("HomColor"),
                                            Color("LPink"),
                                            Color("LPink"),
                                            Color("HomColor"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -10)
                        
                        Text("Chart.").foregroundColor(Color.black.opacity(0.7))
                            .offset(y: -20)
                           
                    }
                }
                  
            }
            Spacer(minLength: 15)
            
            Button(action: {
                self.index = 2
                
            }) {
                VStack{
                    
                    if self.index != 2 {
                        
                        Image(systemName: "waveform.path.ecg")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.7))
                    } else {
                        Image(systemName: "waveform.path.ecg")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .padding()
                            .background{
                                Circle()
                                    .fill(
                                        .linearGradient(colors:[
                                            Color("HomColor"),
                                            Color("LPink"),
                                            Color("LPink"),
                                            Color("HomColor"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -10)
                        
                        Text("Task.").foregroundColor(Color.black.opacity(0.7))
                            .offset(y: -20)
                            
                           
                    }
                }
                   
            }
            Spacer(minLength: 15)
            
            Button(action: {
                self.index = 3
                
            }) {
                VStack{
                    
                    if self.index != 3{
                        
                        Image("More")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.7))
                    } else {
                        Image("More")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .padding()
                            .background{
                                Circle()
                                    .fill(
                                        .linearGradient(colors:[
                                            Color("HomColor"),
                                            Color("LPink"),
                                            Color("LPink"),
                                            Color("HomColor"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -10)
                        
                        Text("More.").foregroundColor(Color.black.opacity(0.7))
                            .offset(y: -20)
                        
                           
                    }
                }
                   
            }
           
        }
        .padding(.vertical, -5)
        .padding(.horizontal,20 )
        .background(Color("HomColor"))
        .animation(.spring())
    }
}
