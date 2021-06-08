//
//  prueba.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 24/05/2021.
//

import SwiftUI

struct Repeating_WithDelay: View {
    @State private var start = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Repeating")
            Text("Repeat With Delay")
            Text("You can add a delay between each repeat of the animation. You want to add the delay modifier BEFORE the repeat modifier.")

            Spacer()

            Button("Start", action: { self.start.toggle() })
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    Circle()
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 0.9)
                        .opacity(start ? 0 : 1)
                        .animation(start ? Animation.easeOut(duration: 0.6)
                            .delay(1) // Add 1 second between animations
                            .repeatForever(autoreverses: true) : .default)
                )
            Spacer()

        }
        .font(.title)
    }
}

struct Repeating_WithDelay_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_WithDelay()
    }
}

//struct prueba: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct prueba_Previews: PreviewProvider {
//    static var previews: some View {
//        prueba()
//    }
//}
