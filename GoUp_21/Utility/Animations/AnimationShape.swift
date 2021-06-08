//
//  AnimationShape.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 24/05/2021.
//

import SwiftUI

enum TimerMode {
    case running
    case paused
    case initial
}

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 15
    
    @Published var timer  = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.timerMode = .initial
                self.secondsLeft = 15
                timer.invalidate()
            } else {
                self.secondsLeft -= 1
            }
        })
    }
}

struct AnimationShape: View {
    
    @State var scale: CGFloat = 1
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            ZStack {
                Color.black
            }
            .clipped()
            .ignoresSafeArea(.all)
            .opacity(0.9)
            
            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.pink)
                .scaleEffect(scale)
                .opacity(opacity)
                .blur(radius: 1.5)
                .onAppear{
                    let baseAnimate = Animation.easeInOut(duration: 1)
                    let repeated = baseAnimate.repeatForever(autoreverses: true)
                    
                    withAnimation(repeated) {
                        scale = 2.9
                        opacity = 0.5
                    }
                }
            
            Circle()
                .frame(width: 70,
                       height: 70,
                       alignment: .center)
                .foregroundColor(.pink)
            
            Text("Please wait..")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .position(x: (UIScreen.main.bounds.width) / 2,
                          y: (UIScreen.main.bounds.height) / 6)
    
        }
        
    }
}

struct AnimationShape_Previews: PreviewProvider {
    static var previews: some View {
        AnimationShape()
    }
}

