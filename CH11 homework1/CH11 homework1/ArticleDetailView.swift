//
//  ArticleDetailView.swift
//  CH11 Navigation
//
//  Created by 陳冠甫 on 2021/1/27.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var article: Article
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Group{
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }.padding(.bottom,0)
                .padding(.horizontal)
                
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
                
            }
        }.edgesIgnoringSafeArea(.all)
        //.navigationBarTitle(".", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            
            self.mode.wrappedValue.dismiss()
            
        }) {
            Image(systemName: "chevron.left.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
        })
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
                ArticleDetailView(article: articles[0])
            }
        }
    }
