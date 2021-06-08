//
//  PrincipalView.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 23/05/2021.
//

import SwiftUI
import Firebase

struct PrincipalView: View {
    @ObservedObject private var npsPr = GlobalNPS(aStatus: [needNPS]())
    @ObservedObject var signed: Signed_Auth
    
    @State var showView = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack {
                    Button(action: {
                        signed.LogOut()
                        signed.signed = false
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.init(hexStringToUIColor(hex: "#EB695B")))
                        Text("Sign out")
                            .font(.system(size: 20))
                            .foregroundColor(Color.gray)
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: SettingsView()) {
                        HStack {
                            Text("Settings")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.green)
                        }
                        
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding(.all, 10)
                
                VStack {
                    nps(statusNPS: npsPr.npsPrincipal)
                    
                    HStack(spacing: 20) {
                        ForEach(npsPr.aStatus, id: \.id) { need in
                            StatusView(dataStatus: need.score)
                        }
                    }
                    .padding(.bottom, heightScreem()/22)
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: heightScreem(),
                    alignment: .center
                )
                
            }
            .padding(.top, heightScreem()/10)
            .edgesIgnoringSafeArea(.top)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: heightScreem(),
                alignment: .top
            )
            .background(Color.init(hexStringToUIColor(hex: "#070914")))
            .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
            .layoutPriority(1)

            //Section: Inputs and Button
            ZStack {
                VStack {
                    inputCalifications(inputs: npsPr)
                        .padding(.bottom, 15)
                    
                    Button(action: {
                        verifTextField()
                    }) {
                        Text("Calcular NPS")
                    }
                    .frame(width: 200, height: 50, alignment: .center)
                    .accentColor(.white)
                    .background(Color.init(hexStringToUIColor(hex: "60C291")))
                    .cornerRadius(25)
                    .font(.system(size: 23))
                    .padding(.top, 15)
                }
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .top
            )
            .edgesIgnoringSafeArea(.bottom)
            .preferredColorScheme(.light)
        }
        .background(Color.init(hexStringToUIColor(hex: "#1A1C21")))
        .edgesIgnoringSafeArea(.all)
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
    }
    
    func verifTextField() {
        // Falta agregar mensaje de error
        if !npsPr.verifInputs() {
            withAnimation(.easeInOut(duration: 0.8), {
                self.npsPr.globalCalcNPS(promotor: Float(npsPr.inputProm) ?? 0,
                                         neutro: Float(npsPr.inputNeut) ?? 0,
                                         detractor: Float(npsPr.inputDect) ?? 0)
                }
            )
        }
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView(signed: Signed_Auth())
    }
}
