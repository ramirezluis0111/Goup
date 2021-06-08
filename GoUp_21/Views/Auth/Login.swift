//
//  Login.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 22/05/2021.
//

import SwiftUI
import Firebase

struct Login: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var opac: Double = 1
    @State private var lala: Bool = false
    
    @ObservedObject var signed: Signed_Auth
    
    var body: some View {
//        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Text("Sign in")
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .font(.system(size: 60))
                            .padding(.top, 50)
                        
                        Text("Incorrect Username or Password")
                            .padding(.vertical)
                            .opacity(signed.fail ? opac : 0)
                            .font(.system(size: 20))
                            .foregroundColor(.pink)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 1.5))
                    }
                    .padding(30)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: heightScreem()/1.5,
                        alignment: .center
                    )
                    
                    
                    VStack (alignment: .leading){
                        Text("Username:")
                            .foregroundColor(.white)
                        ZStack(alignment: .bottom) {
                            TextField("", text: $user)
                                .textFieldStyle(PlaceholderTextFieldStyle("Username", text: $user))
                                .frame(width: 300, height: 60, alignment: .center)
                                .onTapGesture {
                                    signed.fail = false
                                }
                            rectangleView(colorSelect: "#EB695B")
                        }
                        Text("Password:")
                            .foregroundColor(.white)
                        ZStack(alignment: .bottom) {
                            SecureField("", text: $password)
                                .textFieldStyle(PlaceholderTextFieldStyle("Password", text: $password))
                                .frame(width: 300, height: 60, alignment: .center)
                                .onTapGesture {
                                    signed.fail = false
                                }
                            rectangleView(colorSelect: "#EB695B")
                        }
                        
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: heightScreem()/2,
                        alignment: .top
                    )
                    
                    Button(action: {
                        print("Login: \(signed.wait)")
                        signed.login(user: user, password: password)
                    }) {
                        Text("Sign in")
                    }
                    .frame(width: 200, height: 50, alignment: .center)
                    .accentColor(.white)
                    .background(Color.init(hexStringToUIColor(hex: "60C291")))
                    .cornerRadius(25)
                    .font(.system(size: 23))
                    .padding(.top, 15)
                    
                }
                
                if signed.wait {
                    AnimationShape()
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            )
            .background(Color.init(hexStringToUIColor(hex: "#1A1C21")))
            .ignoresSafeArea(.all)
            
        }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(signed: Signed_Auth())
    }
}
