//
//  ContentView.swift
//  CH9 ex CardView
//
//  Created by 陳冠甫 on 2021/1/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    @State private var count = 0
    
    var body: some View {
        
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                    Text("MONDAY,JAN 20")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Your Reading")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                    }.padding(.leading,20)
                    Spacer()
                }
                if !show{
                    cardViews[count]
                        .transition(.com1)
                }
                if show{
                    cardViews[count]
                        .transition(.com2)
                }
                Spacer()
            }.onTapGesture{
                self.count = (self.count + 1) % cardViews.count
                
                withAnimation(Animation.spring()){
                    self.show.toggle()
                }
            }
    }
}
extension AnyTransition{
    static var com1: AnyTransition{
        AnyTransition.offset(x: 600).combined(with: .opacity)
    }
}

extension AnyTransition{
    static var com2: AnyTransition{
        AnyTransition.asymmetric(insertion: AnyTransition.offset(y: -800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .bottom)),
            removal: AnyTransition.offset(y: -800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .bottom)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
