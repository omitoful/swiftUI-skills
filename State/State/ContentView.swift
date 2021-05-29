//
//  ContentView.swift
//  State
//
//  Created by 陳冠甫 on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isplaying = false
    @State private var counter = 0
    @State private var counter2 = 0
    @State private var counter3 = 0
    
    @State private var main = 0
    
    
    var body: some View {
        VStack{
            Button(action: {
                self.isplaying.toggle()
            }, label: {
                Image(systemName: isplaying ?  "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(isplaying ? .red : .green)
            })
            
            Text("\(main)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
            
            ButtonView(counter: $counter, main: $main, color: .red)
                
            ButtonView(counter: $counter2, main: $main, color: .blue)
            
            ButtonView(counter: $counter3, main: $main, color: .green)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
