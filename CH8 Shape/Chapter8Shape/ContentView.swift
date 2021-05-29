//
//  ContentView.swift
//  Chapter8Shape
//
//  Created by 陳冠甫 on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //$$$$$$$$$$ Core Graphics API $$$$$$$$
        
//        VStack{
//            Path() { path in
//                path.move(to: CGPoint(x: 20, y: 20))
//                path.addLine(to: CGPoint(x: 300, y: 20))
//                path.addLine(to: CGPoint(x: 300, y: 300))
//                path.addLine(to: CGPoint(x: 270, y: 300))
//                path.addQuadCurve(to: CGPoint(x: 50, y: 300), control: CGPoint(x: 160, y: 400))
//                path.addLine(to: CGPoint(x: 20, y: 300))
//                path.closeSubpath()
//
//            }//.fill(Color.blue)
//            .stroke(Color.black, lineWidth: 10)}
        VStack{
            ZStack{
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 190.0), clockwise: true)}.fill(Color(.systemYellow))
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 190.0), endAngle: Angle(degrees: 110.0), clockwise: true)}.fill(Color(.systemTeal))
                
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 90.0), endAngle: Angle(degrees: 0.0), clockwise: true)}.fill(Color(.systemGray))
                    .offset(x: 10, y: 10)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    .overlay(Text("25%")
                                .offset(x: 70, y: 70)
                                .foregroundColor(.white))
                
                Path() { path in
                    path.move(to: CGPoint(x: 200, y: 200))
                    path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 110.0), endAngle: Angle(degrees: 90.0), clockwise: true)}.fill(Color.red)
            }
            
            Path(){ path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
                path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
            }.fill(Color(.systemTeal))
            
            Button(action: {
                
            }, label: {
                Text("Button")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                    .background(Dome().fill(Color.red))
            })
            
            }
        }
    }


struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width*0.2)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
