//
//  ContentView.swift
//  CH17 multiGesture
//
//  Created by 陳冠甫 on 2021/2/2.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var isPressed = false
    @GestureState private var dragOffst = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 150))
            .opacity(isPressed ? 0.5 : 1)
            .offset(x: position.width + dragOffst.width, y: position.height + dragOffst.height)
            .animation(.easeInOut)
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .updating($isPressed, body: { (a, state, transaction) in
                        state = a
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffst, body: { (value, state, transaction) in
                        switch value{
                        case.first(true):
                            print("Tapping")
                        case.second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    })
                
                    .onEnded( { value in
                        
                        guard case.second(true, let drag?) = value else{
                            return
                        }
                        
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                        
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
