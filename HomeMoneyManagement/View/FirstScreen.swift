//
//  FirstScreen.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        ZStack{
           Color("LightBlack")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack{
                    Button{
                        
                    } label: {
                        Image(systemName: "book")
                            .foregroundColor(.white)
                            
                    }
                    Button{
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            
                    }
                    Button{
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding()
                ScrollView(.vertical, showsIndicators: false){
                    HStack(spacing:18){
                        ForEach(TaskType.allCases,id: \.self){type in
                            TaskTypeView(type: type)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal,30)
                }
                Button{
                    
                } label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(RadialGradient(colors: [.pink,.red,.yellow], center: .center, startRadius: 1, endRadius: 60))
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .padding(.vertical,600)
                        
                }
                
                .padding(30)
                
            }
        }
    }
    @ViewBuilder
        func TaskTypeView(type: TaskType)->some View{
            Button {
                      
            }label: {
                Text(type.rawValue)
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
    }
}
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
