//
//  inputCalifications.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 07/05/2021.
//

import SwiftUI
import UIKit

struct inputCalifications: View {
    @State private var detractor: String = ""
    @State private var neutro: String = ""
    @State private var promotor: String = ""
    @ObservedObject var inputs: GlobalNPS
    
    var body: some View {
        VStack {
            Text("Ingresa tus calificaciones de hoy:")
                .frame(width: 340, height: 40, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.top, 3)
            
            HStack {
                ZStack(alignment: .bottom) {
                    TextField("", text: $inputs.inputDect)
                        .textFieldStyle(PlaceholderTextFieldStyle("Detractor", text: $inputs.inputDect))
                        .keyboardType(.numberPad)
                    rectangleView(colorSelect: "#EB695B")
                }
                .frame(width: 110, height: 70, alignment: .center)
                
                ZStack(alignment: .bottom) {
                    TextField("", text: $inputs.inputNeut)
                        .textFieldStyle(PlaceholderTextFieldStyle("Neutro", text: $inputs.inputNeut))
                        .keyboardType(.numberPad)
                    rectangleView(colorSelect: "#FFC857")
                }
                .frame(width: 110, height: 70, alignment: .center)
                
                ZStack(alignment: .bottom) {
                    TextField("", text: $inputs.inputProm)
                        .textFieldStyle(PlaceholderTextFieldStyle("Promotor", text: $inputs.inputProm))
                        .keyboardType(.numberPad)
                    rectangleView(colorSelect: "#1FD35D")
                }
                .frame(width: 110, height: 70, alignment: .center)
            }
        }
    }
}

struct rectangleView: View {
    var colorSelect: String = ""
    
    var body: some View {
        Rectangle()
            .fill(Color.init(hexStringToUIColor(hex: colorSelect)))
            .frame(width: 40, height: 4)
            .cornerRadius(10)    }
}

struct inputCalifications_Previews: PreviewProvider {
    static var previews: some View {
        inputCalifications(inputs: GlobalNPS(aStatus: [needNPS]()))
    }
}

