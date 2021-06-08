//
//  modalRegister.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 29/05/2021.
//

import SwiftUI

struct ModalRegister: View {
    
    @State var scale: CGFloat = 1
    @State var opacity: Double = 0
    @ObservedObject var signed: Signed_Auth
    
    var body: some View {
        ZStack {
            
            ZStack {
                Color.black
            }
            .clipped()
            .ignoresSafeArea(.all)
            .opacity(0.9)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: UIScreen.main.bounds.width / 1.3,
                       height: UIScreen.main.bounds.height / 4,
                       alignment: .center)
                .foregroundColor(Color.init(hexStringToUIColor(hex: "#181F24")))
            
            VStack {
                
                Text(signed.fail && signed.error != ""
                        ? "We detected a drawback!" : "User Created!")
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .font(.system(size: signed.fail && signed.error != ""
                                    ? 20 : 25))
                    .foregroundColor(Color.init(hexStringToUIColor(hex: "#EB695B")))
                                
                if (signed.fail && signed.error != "") {
                    Text("\(signed.error)")
                        .frame(width: UIScreen.main.bounds.width / 1.5,
                               alignment: .center)
                        .padding(5)
                        .foregroundColor(Color.init(hexStringToUIColor(hex: "#EB695B")))
                }
                
                HStack {
                    Button(action: {
                        signed.created = false
                        signed.fail = false
                    }, label: {
                        Text("Done")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .frame(width: 120, height: 45, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius:25)
                                        .stroke(Color.init(hexStringToUIColor(hex: "60C291")), lineWidth: 2))
                            .padding(.vertical, 15)
                    })
                }
            }
        }
    }
}

struct ModalRegister_Previews: PreviewProvider {
    static var previews: some View {
        ModalRegister(signed: Signed_Auth())
            
    }
}

