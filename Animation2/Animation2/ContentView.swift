//
//  ContentView.swift
//  Animation2
//
//  Created by 陳冠甫 on 2021/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recordBegin = false
    @State private var recording = false
    
    @State private var show = false
    @State private var show2 = false
    
    var body: some View {
        
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: recordBegin ? 80 : 15)
                    .frame(width: recordBegin ? 150 : 300, height: 150)
                    .foregroundColor(Color(.systemGreen))
                    .overlay(
                        Image(systemName: "mic.fill")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white))
                                .scaleEffect(recording ? 0.8 : 1)
                
                RoundedRectangle(cornerRadius: recordBegin ? 75 : 10)
                    .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                    .stroke(Color.white, lineWidth: 5)
                    .frame(width: recordBegin ? 130 : 280, height: 130)
            }
            .onTapGesture {
                withAnimation(Animation.spring()) {
                    self.recordBegin.toggle()
                }
                withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                    self.recording.toggle()
                }
            }
            
            //=======================================================
            HStack{
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color.green)
                        .overlay(
                            Text("Show Details")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        )
                    if show{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color.purple)
                            .overlay(
                                Text("The Details")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            )
                            .transition(.com)
                    }
                }.onTapGesture {
                    withAnimation(Animation.spring()){
                        self.show.toggle()
                        }
                    }
                
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color.green)
                        .overlay(
                            Text("Show Details2")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        )
                    if show2{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color.purple)
                            .overlay(
                                Text("The Details2")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            )
                            .transition(.com2)
                    }
                }.onTapGesture{
                    withAnimation(Animation.spring()){
                        self.show2.toggle()
                    }
                }
                
            }
            
        }
    }
}


extension AnyTransition{
    static var com: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}

extension AnyTransition{
    static var com2: AnyTransition {
        AnyTransition.asymmetric(insertion: .offset(x: 600, y: 0), removal: .opacity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
