//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by 陳冠甫 on 2021/1/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                print("Hello World".uppercased())
            }, label: {
                Text("Hello World")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .border(Color.white, width: 5)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(.purple))
            })
            
            
            Button(action: {
                print("Hello World".uppercased())
            }, label: {
                Text("Hello World")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.purple))
                    .cornerRadius(50)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50).stroke(Color.purple, lineWidth: 5))
            })
            
            
            Button(action: {
                print("Share Tapped".uppercased())
            }) {
                Label(
                    title: { Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                    },
                    icon: { Image(systemName: "square.and.arrow.up")
                        .font(.title)
                        
                    })
            }.buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Edit Tapped".uppercased())
            }) {
                Label(
                    title: { Text("Edit")
                        .fontWeight(.semibold)
                        .font(.title)
                    },
                    icon: { Image(systemName: "square.and.pencil")
                        .font(.title)
                        
                    })
            }.buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Delete Tapped".uppercased())
            }) {
                Label(
                    title: { Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                    },
                    icon: { Image(systemName: "trash")
                        .font(.title)
                    })
            }.buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Delete")
            }) {
                    Circle()
            }.buttonStyle(CircleStyle())
            
            
        }.padding(.horizontal)
    }
}
struct CircleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 100, maxHeight: 100)
            .shadow(color: .gray, radius: 10, x: 10, y: 10)
            .foregroundColor(.black)
            .overlay(Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.red))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .rotationEffect(configuration.isPressed ? Angle(degrees: -45) : Angle(degrees: 0))
    }
}


struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth:0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10, x: 10, y: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
