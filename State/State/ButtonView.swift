//
//  ButtonView.swift
//  State
//
//  Created by 陳冠甫 on 2021/1/21.
//

import SwiftUI

struct ButtonView: View {
    @Binding var counter: Int
    @Binding var main: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
            self.main += 1
        }, label: {
            Circle()
                .frame(width: 100, height:100)
                .foregroundColor(color)
                .overlay(Text("\(counter)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white))
        })
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(counter: Binding.constant(0), main: Binding.constant(0), color: .red)
    }
}
