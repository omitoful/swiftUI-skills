//
//  ContentView.swift
//  ScrollSwiftUI
//
//  Created by 陳冠甫 on 2021/1/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            
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
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon NG")
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                CardView(image: "natural-language-api", category: "Flutter", heading: "Biulding a Complex Layout with Flutter", author: "Lawrence Tan")
                CardView(image: "swiftui-button", category: "IOS", heading: "What's New in Natrual Language API", author: "Sai Kamb")
                
                
                ScrollView(.horizontal) {
                    HStack{
                        Group {
                            CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon NG")
                            CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                            CardView(image: "natural-language-api", category: "Flutter", heading: "Biulding a Complex Layout with Flutter", author: "Lawrence Tan")
                            CardView(image: "swiftui-button", category: "IOS", heading: "What's New in Natrual Language API", author: "Sai Kamb")
                        } .frame(width: 300)
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
