//
//  ContentView.swift
//  CH15 Registration
//
//  Created by 陳冠甫 on 2021/1/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userRedistrationViewModel = UserRegistrationViewModel()
    
    var body: some View {
        VStack{
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .padding(30)
            
            VStack{
                FormFieldView(fieldValue: $userRedistrationViewModel.username, FormName: "Username", isSecure: false)
                CommentView(iconName: "xmark.square",iconColor: userRedistrationViewModel.isUsernameLengthValid ? Color.secondary :Color(red: 251/255, green: 128/255, blue: 128/255), text: "A minimum of 4 characters",isStrikeThrough: userRedistrationViewModel.isUsernameLengthValid)
                    .padding([.bottom,.leading])
            }.padding()
            
            VStack{
                FormFieldView(fieldValue: $userRedistrationViewModel.password, FormName: "Password", isSecure: true)
                VStack{
                    CommentView(iconName: "lock.open",iconColor: userRedistrationViewModel.isPasswordLengthValid ? Color.secondary :Color(red: 251/255, green: 128/255, blue: 128/255) ,text: "A minimum of 8 characters",isStrikeThrough: userRedistrationViewModel.isPasswordLengthValid)
                    CommentView(iconName: "lock.open",iconColor: userRedistrationViewModel.isPasswordCapitalLetter ? Color.secondary :Color(red: 251/255, green: 128/255, blue: 128/255), text: "One uppercase letter",isStrikeThrough: userRedistrationViewModel.isPasswordCapitalLetter)
                }.padding([.bottom,.leading])
            }.padding()
            
            
            VStack{
                FormFieldView(fieldValue: $userRedistrationViewModel.passwordConfirm, FormName: "Confirm Password", isSecure: true)
                
                CommentView(iconName: "xmark.square",iconColor: userRedistrationViewModel.isPasswordConfirmValid ? Color.secondary :Color(red: 251/255, green: 128/255, blue: 128/255), text: "Your confirm password should be the same as password",isStrikeThrough: userRedistrationViewModel.isPasswordConfirmValid)
                    .padding([.bottom,.leading])
                
            }.padding()
            
            
            Button(action: {
                
            }){
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    
                Button(action: {
                    // Proceed to Sign in screen
                }) {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }.padding(.top, 50)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CommentView: View {
    
    var iconName:String
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var text = ""
    var isStrikeThrough = false
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

struct FormFieldView: View {
    
    @Binding var fieldValue: String
    var FormName = ""
    var isSecure = false
    
    
    var body: some View {
        
            VStack{
                if !isSecure {
                    TextField(FormName, text: $fieldValue)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding(.horizontal)
                    
                }else {
                    SecureField(FormName, text: $fieldValue)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding(.horizontal)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                    .padding(.horizontal)
            }

    }
}
