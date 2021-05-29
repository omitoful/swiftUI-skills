//
//  CardView.swift
//  CH9 ex CardView
//
//  Created by 陳冠甫 on 2021/1/26.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    var rating: Int
    
    var body: some View {
        
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack{
                VStack(alignment: .leading){
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    Group{
                        HStack(spacing: 5) {
                            ForEach(1...(rating), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .font(.title2)
                                    .foregroundColor(.yellow)
                            }
                        }
                    }.padding(.top)
                }
                Spacer()
            }
            .padding()
        }.cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1))
        .padding([.top, .horizontal])
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon NG", rating: 4)
    }
}

#if DEBUG

let cardViews = [
            CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon NG", rating: 4),
            CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos", rating: 5),
            CardView(image: "swiftui-button", category: "IOS", heading: "What's New in Natrual Language API", author: "Sai Kamb", rating: 5),
            CardView(image: "natural-language-api", category: "Flutter", heading: "Biulding a Complex Layout with Flutter", author: "Lawrence Tan", rating: 3)]

#endif
