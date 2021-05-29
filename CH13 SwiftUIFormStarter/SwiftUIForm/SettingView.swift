//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by 陳冠甫 on 2021/1/29.
//

import SwiftUI

struct SettingView: View {
    
    private var displyOrders = ["Alphabetical", "Show Favorite First", "Show Check-in First"]

    @State private var selectedOrder = 0
    @State private var ShowCheckInOnly = false
    @State private var MaxPriceLevel = 5
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(header: Text("SORT PREFERENCE")){
                    Picker(selection: $selectedOrder, label: Text("DisplayOrder")) {
                        ForEach(displyOrders.indices,id: \.self){
                            Text(self.displyOrders[$0])
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $ShowCheckInOnly) {
                        Text("Show Check-In Only")
                    }
                }
                Stepper(onIncrement: {
                    self.MaxPriceLevel += 1
                    
                    if self.MaxPriceLevel >= 5{
                        self.MaxPriceLevel = 5
                    }
                }, onDecrement: {
                    self.MaxPriceLevel -= 1
                    
                    if self.MaxPriceLevel <= 1{
                        self.MaxPriceLevel = 1
                    }
                }){
                    Text("Show \(String(repeating: "$", count: MaxPriceLevel)) or below")
                }
                
                
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(leading:  Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.down.circle.fill")
                    .font(.title)
                    .foregroundColor(Color(.systemGray))
            }).padding(.top), trailing: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Save").foregroundColor(.gray)
            }).padding(.top,30))
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
