//
//  ContentView.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 05/05/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject private var sign = Signed_Auth()
    
    var body: some View {
        NavigationView {
//            if sign.wait {
//                AnimationShape()
//                    .navigationBarHidden(true)
//                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
//            } else
            if sign.signed {
                PrincipalView(signed: sign)
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                    .navigationBarHidden(true)
            } else {
                PrincipalAuth(signed: sign)
                    .navigationBarHidden(true)
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))

            }
        }
        .background(Color(.blue))

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
}
