//
//  ContentView.swift
//  CH11 Navigation
//
//  Created by 陳冠甫 on 2021/1/27.
//

import SwiftUI

struct ContentView: View {
    var res = [ Res(name: "Cafe Deadend", image: "cafedeadend"),
                 Res(name: "Homei", image: "homei"),
                 Res(name: "Teakha", image: "teakha"),
                 Res(name: "Cafe Loisl", image: "cafeloisl"),
                 Res(name: "Petite Oyster", image: "petiteoyster"),
                 Res(name: "For Kee Restaurant", image: "forkeerestaurant"),
                 Res(name: "Po's Atelier", image: "posatelier"),
                 Res(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                 Res(name: "Haigh's Chocolate", image: "haighschocolate"),
                 Res(name: "Palomino Espresso", image: "palominoespresso"),
                 Res(name: "Homei", image: "upstate"),
                 Res(name: "Traif", image: "traif"),
                 Res(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                 Res(name: "Waffle & Wolf", image: "wafflewolf"),
                 Res(name: "Five Leaves", image: "fiveleaves"),
                 Res(name: "Cafe Lore", image: "cafelore"),
                 Res(name: "Confessional", image: "confessional"),
                 Res(name: "Barrafina", image: "barrafina"),
                 Res(name: "Donostia", image: "donostia"),
                 Res(name: "Royal Oak", image: "royaloak"),
                 Res(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    
    init() {
        let navBarApp = UINavigationBarAppearance()
        navBarApp.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGreen, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarApp.titleTextAttributes = [.foregroundColor: UIColor.systemGreen, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarApp.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navBarApp
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApp
        UINavigationBar.appearance().compactAppearance = navBarApp
        
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        
        
        
        NavigationView {
            List{
                ForEach(res) { res in
                    NavigationLink(destination: resDetailView(resN: res)) {
                            BasicImageRow(resN: res)
                        }
                }
            }.navigationBarTitle("Restaurant", displayMode: .automatic)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Res:Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImageRow: View {
    var resN:Res
    
    var body: some View {
        HStack{
            Image(resN.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(resN.name)
        }
    }
}

struct resDetailView: View {
    
    @Environment(\.presentationMode) var mode
    
    var resN: Res
    
    var body: some View {
        VStack{
            Image(resN.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(resN.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            
            self.mode.wrappedValue.dismiss()
            
        }) {
            Text("\(Image(systemName: "chevron.left")) \(resN.name)")
                .foregroundColor(.black)
        })
    }
}
