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
           Color.black
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack{
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
                .padding()
                ScrollView(.vertical, showsIndicators: false){
                    HStack(spacing:18){
                        ForEach(TaskType.allCases,id: \.self){type in
                            TaskTypeView(type: type)
                        }
                    }
                }
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
