//
//  ResDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by 陳冠甫 on 2021/2/2.
//

import SwiftUI

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
    
    var isDragging:Bool{
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}



struct ResDetailView: View {
    
    enum ViewState {
        case full
        case half
    }
    
    let restaurant:Restaurant
    
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset:CGFloat = 0.0
    
    
    @State private var viewState = ViewState.half
    @Binding var isShow:Bool
    @State private var scrollOffset:CGFloat = 0.0

    var body: some View {
        GeometryReader{ geometry in
        
            VStack{
                Spacer()
                
                smallBar()
                
                ScrollView(.vertical){
                
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(key: ScrollOffsetKey.self, value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                        
                    }.frame(height: 0)
                    VStack{
                        TitleBar()
                        
                        HeaderView(restaurant: restaurant)
                        
                        DetailInfoView(icon: "map", info: restaurant.location)
                            .padding(.top)
                        DetailInfoView(icon: "phone", info: restaurant.phone)
                        DetailInfoView(icon: nil, info: restaurant.description)
                            .padding(.top)
                            .padding(.bottom,100)
                    }.offset(y: -self.scrollOffset)
                    .animation(nil)
                }
                .background(Color.white)
                .cornerRadius(10,antialiased: true)
                //.disabled(true) 可以此視圖功能，直接拖移整個視圖來上下滑動，但無法查看滾動式圖的細節。
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
            
            }.offset(y: geometry.size.height/2 + self.dragState.translation.height + self.positionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                if self.viewState == .full{
                    self.scrollOffset = value > 0 ? value : 0
                    
                    if self.scrollOffset > 120 {
                        self.positionOffset = 0
                        self.viewState = .half
                        self.scrollOffset = 0
                    }
                }
            }
            .gesture(DragGesture()
                        .updating(self.$dragState, body: {(value, state, transaction) in state = .dragging(translation: value.translation)
                })
                        .onEnded({value in
                            if self.viewState == .half{
                                //界限值1
                                //向上滑並超過界線值時，
                                //透過更新位置偏移量，已將試圖狀態改為全開
                                if value.translation.height < -geometry.size.height * 0.25{
                                    self.positionOffset = -geometry.size.height/2 + 50
                                    self.viewState = .full
                                }
                                //界限值2
                                //向下滑並超過界線值時，
                                //透過設定isShow為false來關閉視圖
                                if value.translation.height > geometry.size.height * 0.3 {
                                    self.isShow = false
                                }
                            }
                            
                        })
            
                    )
            
            
        }
    }
}

struct ResDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResDetailView(restaurant: restaurants[0], isShow: .constant(true))
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
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal)
    }
    
}

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
    
}
