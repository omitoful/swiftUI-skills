//
//  ContentView.swift
//  CH17 Gesture
//
//  Created by 陳冠甫 on 2021/2/1.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    @State private var isPressed2 = false
    
    @GestureState private var longPressTap = false
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        
        
        VStack {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 150))
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeIn)
                .foregroundColor(.blue)
                .gesture(
                    TapGesture()
                        .onEnded{self.isPressed.toggle()}
            )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 150))
                .opacity(longPressTap ? 0.5 : 1.0)
                .foregroundColor(isPressed2 ? .blue : .green)
                .animation(.easeIn)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .updating($longPressTap, body: {
                            (currentState, state, transaction) in state = currentState
                        })
                        .onEnded{_ in self.isPressed2.toggle()}
            )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 150))
                .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                .animation(.easeInOut)
                .foregroundColor(.red)
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: {(value, state, transaction) in state = value.translation
                            
                        })
                        .onEnded{ value in
                            self.position.height += value.translation.height
                            self.position.width += value.translation.width
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
