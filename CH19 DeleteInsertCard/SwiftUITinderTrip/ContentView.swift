//
//  ContentView.swift
//  SwiftUITinderTrip
//
//  Created by Simon Ng on 17/12/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //製作拖曳界限值，製作愛心跟叉叉
    private let dragThreshold:CGFloat = 40.0
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation:CGSize)
        
        var translation:CGSize{
            switch self {
            case .inactive,.pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isPressing:Bool {
            switch self {
            case .pressing,.dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    @GestureState private var dragState = DragState.inactive
    
    
    
    private func isTOPCard(cardView: CardView)->Bool{
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else{
            return false
        }
        return index == 0
    }
    
//--------------------------------------------------------------
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        
        for i in 0..<2{
            views.append(CardView(image: trips[i].image , title: trips[i].destination))
        }
        return views
        
    }()
    
    @State private var lastIndex = 1
    
    private func moveCard(){
        cardViews.removeFirst()
        
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        
        let newCardView = CardView(image: trip.image, title: trip.destination)
        
        cardViews.append(newCardView)
    }
    
//---------------------------------------------------------------------------------
    //加入試圖轉場動畫（最下方有動畫宣告）
    @State private var removalTransition = AnyTransition.trailingBottom
    
    
    var body: some View {
        VStack{
            TopMenuBar()
            ZStack{
                
                ForEach(cardViews){cardView in
                    cardView
                        .zIndex(isTOPCard(cardView: cardView) ? 1:0)
                        .overlay(
                            ZStack{
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.red)
                                    .font(.system(size: 150))
                                    .opacity(isTOPCard(cardView: cardView) && self.dragState.translation.width >  dragThreshold ? 1.0:0)
                                
                                Image(systemName: "x.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 150))
                                    .opacity(isTOPCard(cardView: cardView) && self.dragState.translation.width < -dragThreshold ? 1.0:0)
                            }
                        )
                        .offset(x:isTOPCard(cardView: cardView) ? self.dragState.translation.width:0, y:isTOPCard(cardView: cardView) ?  self.dragState.translation.height:0)
                        .rotationEffect(Angle(degrees: Double(isTOPCard(cardView: cardView) ? self.dragState.translation.width/10 : 0)))
                        .scaleEffect(isTOPCard(cardView: cardView) && self.dragState.isPressing ? 1.1:1.0)
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .transition(self.removalTransition)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body:{ (value, state, transaction) in
                                    switch value{
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                //置換視圖左右轉場功能
                                .onChanged({ value in
                                    guard case .second(true,let drag?) = value else{
                                        return
                                    }
                                    if drag.translation.width < -self.dragThreshold*2 {
                                        self.removalTransition = .leadingBottom
                                    }
                                    if drag.translation.width > self.dragThreshold*2 {
                                        self.removalTransition = .trailingBottom
                                    }
                                    
                                })
                                .onEnded({ value in
                                    guard case .second(true,let drag?) = value else{
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragThreshold*2 || drag.translation.width > self.dragThreshold*2 {
                                        self.moveCard()
                                    }
                                    
                                })
                        )
                        
                }
                
            }
            
            Spacer(minLength: 20)
            
            BottomMenuView()
                .opacity(self.dragState.isPressing ? 0:1)
                .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
//            TopMenuBar().previewLayout(.fixed(width: 375, height: 60))
//            BottomMenuView().previewLayout(.fixed(width: 375, height: 60))
        }
    }
}

struct TopMenuBar:View {
    var body: some View {
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 35))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
            
        }.padding()
    }
    
}

struct BottomMenuView: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.black)
            
            Button(action: {
                //
            }) {
                Text("BOOK IT NOW")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal,35)
                    .padding(.vertical,15)
                    .background(Color.black)
                    .cornerRadius(5)
            }.padding(.horizontal,20)
            
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
    }
    
}

extension AnyTransition{
    static var trailingBottom:AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: AnyTransition.move(edge: .bottom)))
    }
    static var leadingBottom:AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: AnyTransition.move(edge: .bottom)))
    }
    
    
}
