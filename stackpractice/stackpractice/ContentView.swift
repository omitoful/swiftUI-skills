//
//  ContentView.swift
//  stackpractice
//
//  Created by 陳冠甫 on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                HeaderView().padding(20)
            Spacer()
            }
            HStack(spacing: 20){
                PriceView(title: "Basic", price: "$9", textcolor: .white, bgcolor: .purple)
                
                ZStack {
                PriceView(title: "Pro", price: "$19", textcolor: .black, bgcolor: Color(red: 240/255, green: 240/255, blue: 240/255))
                SuggestView(suggestion: "Best for designer")
                }
            }.padding(.horizontal)
            
            ZStack{
                PriceView(icon: "wand.and.rays", title: "Team", price: "$299", textcolor: .white, bgcolor: .black)
                    .padding()
                
                SuggestView(suggestion: "Perfect for teams with 20 members")
                    .offset(x: 0, y: 15)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct PriceView: View {
    var icon: String?
    var title: String
    var price: String
    var textcolor: Color
    var bgcolor: Color
    var body: some View {
        VStack{
            
            if let icon = icon {
                
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textcolor)
            }
            
            Text(title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textcolor)
            Text(price)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(textcolor)
            Text("per month")
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(textcolor)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 100)
        .padding(30)
        .background(bgcolor)
        .cornerRadius(10)
    }
}

struct SuggestView: View {
    var suggestion: String
    var body: some View {
        Text(suggestion)
            .font(.system(.caption, design: .rounded))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red:255/255, green:183/255, blue:37/255))
            .offset(x: 0, y: 90)
    }
}
