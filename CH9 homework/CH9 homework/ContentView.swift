//
//  ContentView.swift
//  CH9 homework
//
//  Created by 陳冠甫 on 2021/1/26.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isprogress = false
    
    @State private var processing = false
    @State private var loading = false
    @State private var completed = false
    
    var body: some View {
        
        VStack{
            ZStack{
                if !processing{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 250, height: 80)
                        .foregroundColor(.green)
                    Text("Submit")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .transition(.opacity)
                }
                if processing && !completed{
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 250, height: 80)
                            .foregroundColor(processing ? Color(.systemGray5) : .green)
                        Text("Submit")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        VStack{
                            ZStack{
                                Circle()
                                    .stroke(Color(.systemBlue), lineWidth: 20)
                                    .frame(width: 50, height: 50)
                                    .opacity(0.6)
                                    .rotationEffect(Angle(degrees: isprogress ? -360 : 0))
                                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                                    .onAppear(){
                                        self.isprogress = true
                                    }
                                Circle()
                                    .trim(from: 0.5, to: 1)
                                    .stroke(Color(.systemGreen), lineWidth: 20)
                                    .frame(width: 50, height: 50)
                                    .opacity(0.6)
                                    .rotationEffect(Angle(degrees: isprogress ? 360 : 0))
                                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                                    .onAppear(){
                                        self.isprogress = true
                                    }
                            }
                                .padding(10)
                            Text("  progressing...")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }.offset(x: 0, y: 300)
                    }.transition(.opacity)
                    .onAppear() {
                        self.startPro()
                    }
                }
                if completed {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 250, height: 80)
                        .foregroundColor(completed ? .red : .gray)
                    Text("Done")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .onAppear(){
                            self.endPro()
                        }
                }
            }
            .animation(.spring())
            .onTapGesture {
                self.processing = true
                
        }

        }
    }
    private func startPro() {
        self.loading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }
        
    
    private func endPro() {
        // Reset the button's state
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.processing = false
            self.completed = false
            self.loading = false
            self.isprogress = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
