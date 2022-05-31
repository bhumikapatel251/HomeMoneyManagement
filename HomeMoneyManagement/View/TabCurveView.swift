//
//  TabCurveView.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 25/05/22.
//

import SwiftUI


struct TabCurveView: View {
    
    var body: some View {
        Trans()
    }
}

struct TabCurveView_Previews: PreviewProvider {
    static var previews: some View {
        TabCurveView()
    }
}

struct Trans: View {
    @State var selectiontab = "Trans."
    
    // all screen one color with tab
    init(){
        UITabBar.appearance().isHidden = true
    }
    // location for each curve..
  //  @State var xAxis: CGFloat = 0
   // @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectiontab) {
                
                FirstScreen()
                    .tag("Trans")
                    .ignoresSafeArea(.all, edges: .all)
                Color.blue
                   .tag("Chart")
                   .ignoresSafeArea(.all, edges: .all)
                Color.purple
                   .tag("Base")
                   .ignoresSafeArea(.all, edges: .all)
                Color.red
                   .tag("More")
                   .ignoresSafeArea(.all, edges: .all)
            }
            // custom tab bar
            HStack(spacing: 0){
                // image set in tab
                ForEach(tabs,id : \.self){image in
                    //GeometryReader{reader in
                        Button(action: {
                           withAnimation(){
                              selectiontab = image
                             //xAxis = reader.frame(in: .global).minX
                           }
                        }, label: {
                            Image(image)
                                
                                .resizable()
                                .renderingMode(.template)
                                
                                //.clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                               // .foregroundColor(getColor(image: image))
                            // Clicking wise change on and off mode color
                                .foregroundColor(selectiontab == image ? Color.purple : Color.gray)
                                //.padding(selectiontab == image ? 15 : 0)
                               // . background(Color.white.opacity(selectiontab == image ? 1 : 0).clipShape(Circle()))
                               // .matchedGeometryEffect(id: image, in: animation)
                               // .offset( y: selectiontab == image ? -50 : 0)
                                                 //x: selectiontab == image ? (x:reader.frame(in: .global).minX - reader.frame(in: .global).maxX) : 0,
                    })
//                        .onAppear(perform: {
//
//                            if image == tabs.first{
//                             //   xAxis = reader.frame(in: .global).minX
//                            }
//                        })
                   // }
                    .frame(width: 25, height: 25)
                    // between space
                    if image != tabs.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,30)
            .padding(.leading)
            .padding(.vertical)
            // diffrent way leaved
//            .background{
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(
//                        .linearGradient(colors:[
//                            Color("G4"),
//                            Color("G5"),
//                            Color("G5"),
//                            Color("G4"),
//                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
//
//                    )
//                   // .clipShape(CustomShape(xAxis: xAxis))
//
//            }
            
           
            // bottom edge
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        .linearGradient(colors:[
                            Color("G4"),
                            Color("G5"),
                            Color("G5"),
                            Color("G4"),
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)

                    )
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
//    // getting image color
//    func getColor(image: String)->Color{
//        switch image {
//        case "Trans.":
//            return Color("Yellow")
//        case "Chart.":
//            return Color("G4")
//        case "Base.":
//            return Color("G1")
//        default:
//            return Color.red
//        }
//    }
}

var tabs = ["Trans","Chart","Base","More"]


//// Curve
//struct CustomShape: Shape {
//
//    var xAxis: CGFloat
//
//    //Animation path
//    var animatableData: CGFloat{
//        get{return xAxis}
//        set{xAxis = newValue}
//    }
//
//    func path(in rect: CGRect)->Path {
//        return Path{path in
//
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//            path.addLine(to: CGPoint(x: 0, y: rect.height))
//
//            let center = xAxis
//
//            path.move(to: CGPoint(x: center - 50, y: 0))
//
//            let to1 = CGPoint(x: center, y: 35)
//            let control1 = CGPoint(x: center - 25, y: 0)
//            let control2 = CGPoint(x: center - 25, y: 35)
//
//            let to2 = CGPoint(x: center + 50, y: 0)
//            let control3 = CGPoint(x: center + 30, y: 35)
//            let control4 = CGPoint(x: center + 30, y: 0)
//            // add cruve
//            path.addCurve(to: to1, control1: control1, control2: control2)
//            path.addCurve(to: to2, control1: control3, control2: control4)
////
//        }
//    }
//}
