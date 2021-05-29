//
//  ResDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by 陳冠甫 on 2021/2/2.
//

import SwiftUI


struct ResDetailView: View {
    
    let restaurant:Restaurant
    
    var body: some View {
        GeometryReader{ geometry in
        
            VStack{
                Spacer()
                
                smallBar()
                
                ScrollView(.vertical){
                
                    TitleBar()
                    
                    HeaderView(restaurant: restaurant)
                    
                    DetailInfoView(icon: "map", info: restaurant.location)
                        .padding(.top)
                    DetailInfoView(icon: "phone", info: restaurant.phone)
                    DetailInfoView(icon: nil, info: restaurant.description)
                        .padding(.top)
                }
                .background(Color.white)
                .cornerRadius(10,antialiased: true)
            
            }.offset(y: geometry.size.height/2)
            .animation(.interpolatingSpring(stiffness: 200, damping: 25, initialVelocity: 10))
            .edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

struct ResDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResDetailView(restaurant: restaurants[0])
            .background(Color.black.opacity(0.3))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView:View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack{
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .overlay(
                    HStack{
                        VStack(alignment: .leading){
                            Spacer()
                            Text(restaurant.name)
                                .font(.system(.title, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                            Text(restaurant.type)
                                .font(.system(.headline, design: .rounded))
                                .padding(5)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(5)
                                
                        }
                        Spacer()
                    }.padding()
                )
        }
        
        
    }
}

struct smallBar:View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
    
}

struct TitleBar:View {
    var body: some View {
        HStack{
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }.padding()
    }
    
}

struct DetailInfoView:View {
   
    let icon: String?
    let info: String
    
    var body: some View {
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .padding(10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal)
    }
    
}
