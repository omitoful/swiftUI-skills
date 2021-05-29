//
//  ContentView.swift
//  Circle progress
//
//  Created by 陳冠甫 on 2021/1/25.
//

import SwiftUI

struct ContentView: View {
    
    private var CircleGradient = LinearGradient(gradient: Gradient(colors: [Color(red:207/255, green: 150/255, blue:207/255),Color(red:107/255, green: 116/255, blue:179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(CircleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay(
                    VStack{
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        
                        Text("Complete")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.secondary)
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
