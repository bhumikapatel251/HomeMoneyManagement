//
//  TabCurveView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI
//import XCTest

struct TabCurveView: View {
    
    @State var currentTab = "leaf"
    @State var curveAxis: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $currentTab){
            Text("leaf")
                .tag("leaf")
                Text("Account")
                    .tag("Account")
        }
            .clipShape(
                CustomTabCurve(curveAxis: curveAxis)
            )
        .padding(.bottom,-90)
            HStack(spacing: 0){
                TabButtons()
            }
            .frame( height: 50)
            .padding(.horizontal, 35)
            .padding(.bottom,getSafeArea().bottom == 0 ? 20 : 0)
            
        }
        .background(Color("LightBlack"))
        .ignoresSafeArea(.container, edges: .top)
    }
    @ViewBuilder
    func TabButtons()->some View{
        ForEach(["leaf","Account"], id: \.self) { image in
            GeometryReader { proxy in
                Button(action: {
                    withAnimation{
                currentTab = image
                        curveAxis = proxy.frame(in: .global).midX
                    }
                }, label: {
                    Image(systemName: image)
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .frame(width: 45, height: 45)
                        .background(Circle().fill(Color("LightBalck"))
                        ).offset(y: currentTab == image ? -25 : 0)
                })
                .frame(maxWidth: .infinity,alignment: .center)
                .onAppear(perform: {
                    if curveAxis == 0 &&  image == "leaf" {
                        curveAxis = proxy.frame(in: .global).midX
                    }
                })
            }
            .frame(height: 40)
        }
    }
}

struct TabCurveView_Previews: PreviewProvider {
    static var previews: some View {
        TabCurveView()
    }
}

extension View{
    func getRect()->CGRect{
        UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            
            return .zero
        }
        return safeArea
    }
}
