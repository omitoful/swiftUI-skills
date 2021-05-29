//
//  ContentView.swift
//  homework1
//
//  Created by 陳冠甫 on 2021/1/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HeaderView()
            PriceView(icon: "wand.and.rays", title: "Team", price: "$299", textcolor: .white, bgcolor: .black)
                .scaleEffect(1.1)
                .offset(x: 0, y: 440)
            
            PriceView(icon: "star", title: "Pro", price: "$19", textcolor: .black, bgcolor: Color(red: 240/255, green: 240/255, blue: 240/255))
            
            PriceView(icon: "paperplane", title: "Basic", price: "$9", textcolor: .white, bgcolor: .purple)
                .scaleEffect(0.9)
                .offset(x: 0, y: -420)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack{
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
        }
    }
}

struct PriceView: View {
    var icon:String
    var title:String
    var price:String
    var textcolor:Color
    var bgcolor:Color
    
    var body: some View {
        VStack{
            Image(systemName: icon)
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(textcolor)
            Text(title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textcolor)
            Text(price)
                .font(.system(size: 50, weight: .black, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textcolor)
            Text("per month")
                .font(.system(.caption, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textcolor)
        }
        .frame(minWidth: 300, minHeight: 100, maxHeight: 200)
        .padding(10)
        .background(bgcolor)
        .cornerRadius(10)
    }
}
