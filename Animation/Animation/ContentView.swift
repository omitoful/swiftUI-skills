//
//  ContentView.swift
//  Animation
//
//  Created by 陳冠甫 on 2021/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circlecolorChange = false
    @State private var heartcolorChange = false
    @State private var heartsizeChange = false
    
    @State private var isLoading = false
    
    @State private var isLoading2offset = false

    @State private var progress: CGFloat = 0.0
    
    @State private var dot = false
    
    var body: some View {
        
        VStack{
            ZStack{
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(circlecolorChange ? Color(.systemGray5) : Color.red)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(heartcolorChange ? Color.red : Color(.systemGray5))
                    .font(.system(size: 100))
                    .scaleEffect(heartsizeChange ? 1.0 : 0.8)
            }
    //        .animation(.spring(response: 0.7, dampingFraction: 0.3, blendDuration: 0.4))
            .onTapGesture {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.3, blendDuration: 0.4)){
                    self.circlecolorChange.toggle()
                    self.heartcolorChange.toggle()
                }
                self.heartsizeChange.toggle()
            }
            .padding(15)
//-------------------------------------------------------------------------------------------------
            ZStack{
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(Color(.systemGreen), lineWidth: 15)
                    .frame(width: 200, height: 200)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.isLoading = true
                    }
            }.padding(15)
//-------------------------------------------------------------------------------------------------
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 400, height: 20)
                        .cornerRadius(20)
                        .foregroundColor(Color(.systemGray5))
                    Rectangle()
                        .frame(width: 50, height: 15)
                        .cornerRadius(20)
                        .foregroundColor(Color.blue)
                        .offset(CGSize(width: isLoading2offset ? 170 : -170, height: 0))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                        .onAppear() {
                            self.isLoading2offset = true
                        }
                }
                Text("Loading...")
            }.padding(15)
//-------------------------------------------------------------------------------------------------
            ZStack{
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 15)
                    .frame(width: 200, height: 200)
                
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(Color(.systemPurple))
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(.systemPurple), lineWidth: 10)
                    .frame(width: 200, height: 200)
                    .rotationEffect(Angle(degrees: -90))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
                            timer in
                            if Int(self.progress*100) % 2 == 1 {self.progress += 0.03
                                print(self.progress)}
                            else{self.progress += 0.01
                                print(self.progress)}
                            
                            if self.progress >= 1.0 {
                                timer.invalidate()
                            }
                        }
                    }
            }.padding(15)
//-------------------------------------------------------------------------------------------------
            HStack{
                ForEach(0...4, id: \.self) {
                    index in
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.systemIndigo))
                        .scaleEffect(self.dot ? 1.0 : 0.8)
                        .animation(Animation.linear(duration: 0.6).repeatForever().delay(0.3*Double(index)))
                }
            }.onAppear(){
                self.dot = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
