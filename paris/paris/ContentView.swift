//
//  ContentView.swift
//  paris
//
//  Created by 陳冠甫 on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Image("paris")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300)
                .clipped()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.6)
            
            Image("paris")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300)
                .clipShape(Circle())
                .overlay(Color.black
                            .opacity(0.5)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .overlay(Text("P A R I S")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                            )
                )
            
            
//                .overlay(
//                    Image(systemName:"heart.fill")
//                        .font(.system(size: 55))
//                        .foregroundColor(.red)
//                        .overlay(Text("LIKE")
//                                    .bold()
//                                    .foregroundColor(.white),
//                                 alignment: .center
//                        ),alignment: .center
//                )
            VStack() {
            Image(systemName: "cloud.heavyrain")
                .font(.system(size: 70))
                .foregroundColor(.white)
                .padding(20)
            Spacer()
            
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
