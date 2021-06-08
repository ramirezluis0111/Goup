//
//  GoUp_21App.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 05/05/2021.
//

import SwiftUI
import Firebase

@main
struct GoUp_21App: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            AnimationShape()
            ContentView()
        }
    }
}
