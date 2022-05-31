//
//  CircleTabBar.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 31/05/22.
//

import SwiftUI

struct CircleTabBar: View {
    var body: some View {
        VStack{
            
            Spacer()
            
            CircleTab()
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct CircleTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleTabBar()
    }
}

struct CircleTab : View {
    
    @State var index = 0
    
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
                            .foregroundColor(Color.black.opacity(0.2))
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
                                            Color("G4"),
                                            Color("G5"),
                                            Color("G5"),
                                            Color("G4"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Trans.").foregroundColor(Color.purple.opacity(0.7))
                           
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
                            .foregroundColor(Color.black.opacity(0.2))
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
                                            Color("G4"),
                                            Color("G5"),
                                            Color("G5"),
                                            Color("G4"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Chart.").foregroundColor(Color.purple.opacity(0.7))
                           
                    }
                }
                  
            }
            Spacer(minLength: 15)
            
            Button(action: {
                self.index = 2
                
            }) {
                VStack{
                    
                    if self.index != 2 {
                        
                        Image("Base")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.2))
                    } else {
                        Image("Base")
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
                                            Color("G4"),
                                            Color("G5"),
                                            Color("G5"),
                                            Color("G4"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Account.").foregroundColor(Color.purple.opacity(0.7))
                           
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
                            .foregroundColor(Color.black.opacity(0.2))
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
                                            Color("G4"),
                                            Color("G5"),
                                            Color("G5"),
                                            Color("G4"),
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                       
                                    )
                            }
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("More.").foregroundColor(Color.purple.opacity(0.7))
                           
                    }
                }
                   
            }
           
        }
        .padding(.vertical, -10)
        .padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())
    }
}
