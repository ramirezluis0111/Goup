//
//  dateUpdate.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 07/05/2021.
//

import SwiftUI

struct dateUpdate: View {
    var body: some View {
        HStack {
            Text("Calculado: 12/06/20 21:06")
                .foregroundColor(.gray)
                .font(.system(size: 16))
        }
    }
}

struct dateUpdate_Previews: PreviewProvider {
    static var previews: some View {
        dateUpdate()
    }
}
