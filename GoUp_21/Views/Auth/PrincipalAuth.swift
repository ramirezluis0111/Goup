//
//  PrincipalAuth.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 28/05/2021.
//


import SwiftUI
import Firebase

struct PrincipalAuth: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var opac: Double = 1
    @State private var lala: Bool = false
    
    @ObservedObject var signed: Signed_Auth
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center) {
                    VStack {
                        Text("Wellcome to")
                            .foregroundColor(.white)
                            .fontWeight(.thin)
                            .font(.system(size: 30))
                        Text("Goup")
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .font(.system(size: 60))
                    }
                    .padding(30)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: heightScreem()/1.5,
                        alignment: .center
                    )
                    
                    
                    VStack (alignment: .center){
                        NavigationLink(destination: Login(signed: signed)) {
                            Text("Sign in")
                                .frame(width: 200, height: 50, alignment: .center)
                                .accentColor(.white)
                                .background(Color.init(hexStringToUIColor(hex: "60C291")))
                                .cornerRadius(25)
                                .font(.system(size: 23))
                                .padding(15)
                        }
                        NavigationLink(destination: Register(signed: signed)) {
                            Text("Create account")
                                .font(.system(size: 23))
                                .fontWeight(.thin)
                                .frame(width: 200, height: 50, alignment: .center)
                                .accentColor(.white)
                                .overlay(RoundedRectangle(cornerRadius:25)
                                            .stroke(Color.init(hexStringToUIColor(hex: "60C291")), lineWidth: 2))
                                .padding(.top, 15)
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: heightScreem()/2,
                        alignment: .center
                    )
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
}

struct PrincipalAuth_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalAuth(signed: Signed_Auth())
    }
}
