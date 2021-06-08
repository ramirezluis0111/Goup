//
//  TextFieldStyle.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 08/05/2021.
//

import Foundation
import UIKit
import SwiftUI

struct PlaceholderTextFieldStyle: TextFieldStyle {
    let placeholder: String
    
    @Binding var text: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.init(hexStringToUIColor(hex: "#4D5155"))) 
            }
            configuration
        }
        .foregroundColor(.white)//#4D5155
        .font(.system(size: 18))
        .disableAutocorrection(true)
        .padding()
        .background(Color.init(hexStringToUIColor(hex: "#11171A"))) //#11171A
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .multilineTextAlignment(.center)
    }

}



