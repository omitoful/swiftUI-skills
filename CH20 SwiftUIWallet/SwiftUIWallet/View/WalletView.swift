//
//  WalletView.swift
//  SwiftUIWallet
//
//  Created by 陳冠甫 on 2021/2/4.
//

import SwiftUI

struct WalletView: View {
    
    var cards: [Card] = testCards
    
    private static let cardOffset: CGFloat = 50.0
    @State var isCardPresented = false
    
    @State var isCardPressed = false
    @State var selectedCard: Card?
    
    
    var body: some View {
        
        VStack{
            topNavBar()
                .padding(.bottom)
            Spacer()
            
            ZStack{
                if isCardPresented{
                    ForEach(cards){ card in
                        CardView(card: card)
                            .offset(self.offset(for: card))
                            .animation(.default)
                            .scaleEffect(1.0)
                            .padding(.horizontal,35)
                            .zIndex(self.zIndex(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(self.transitionAnimation(for: card))
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation{
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    })
                            )
                    }
                }
            }.onAppear{
                self.isCardPresented.toggle()
            }
            if isCardPressed{
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top,10)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.easeOut(duration: 0.2).delay(0.1))
            }
            
            Spacer()
        }
    }
    
    
    
    
    
    
    private func zIndex(for card:Card) -> Double{
        guard let cardIndex = index(for: card) else{
            return 0.0
        }
        return -Double(cardIndex)
    }
    
    private func index(for card:Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id }) else{
            return nil
        }
        return index
    }
    
    private func offset(for card:Card) -> CGSize{
        guard let cardIndex = index(for: card) else{
            return CGSize()
        }
        
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCradIndex = index(for: selectedCard) else{
                return .zero
            }
            
            if cardIndex >= selectedCradIndex{
                return .zero
            }
            
            let offset = CGSize(width: 0, height: 1400)
            
            return offset
        }
        
        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
    }
    
    
    private func transitionAnimation(for card:Card) -> Animation{
        var delay = 0.0
        
        if let index = index(for: card){
            delay = Double(cards.count - index)*0.1
        }
        return Animation.spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
    
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct topNavBar:View {
    var body: some View {
        HStack{
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
    
}
