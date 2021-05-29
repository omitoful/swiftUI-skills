//
//  ContentView.swift
//  CH10 List
//
//  Created by 陳冠甫 on 2021/1/26.
//

import SwiftUI

struct ContentView: View {
//    var resNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
//
//    var resImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
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
   ].shuffled()
    
    var body: some View {
        //lesson 1
//        HStack {
//            List{
//                Text("Item 1")
//                Text("Item 2")
//                Text("Item 3")
//                Text("Item 4")
//            }
//            List{
//                ForEach(1...4, id: \.self){
//                    i in Text("Item \(i)")
//                }
//            }
//            List{
//                ForEach(1...4, id: \.self){
//                    Text("Item \($0)")
//                }
//            }
//        }
        
        //lesson2
        //List(res, id: \.id) { res in >>>>(在identifable協定中,可簡化)
//        VStack {
//            List(res) { res in
//                BasicImagerow(resplus: res)
//            }
//
//            List(res) { res in
//                FullImagerow(resplus: res)
//            }
//        }
        
        //lesson3
        
        
        List(res.indices) { index in
            
            if (0...1).contains(index) {
                FullImagerow(resplus: res[index])
            }else{
                BasicImagerow(resplus: res[index])
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Res: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImagerow: View {
    var resplus:Res
    
    var body: some View {
        HStack{
            Image(resplus.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(resplus.name)
        }
    }
}

struct FullImagerow: View {
    var resplus:Res
    
    var body: some View {
        ZStack{
            Image(resplus.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .cornerRadius(10)
                .overlay(
                    Rectangle().foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            Text(resplus.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
