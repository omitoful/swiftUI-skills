//
//  CardView.swift
//  SwiftUIWallet
//
//  Created by 陳冠甫 on 2021/2/4.
//

import SwiftUI

struct CardView: View {
    var card:Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading){
                    Text(card.number)
                        .bold()
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid Thur")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                .foregroundColor(.white)
                .padding(.leading,25)
                .padding(.bottom,20)
                
                ,alignment: .bottomLeading)
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(testCards){ card in
                CardView(card: card).previewLayout(.sizeThatFits)
            }
        }
    }
}
