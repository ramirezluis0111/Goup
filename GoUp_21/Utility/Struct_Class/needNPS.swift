//
//  lala.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 20/05/2021.
//

import Foundation

struct needNPS {
    let id = UUID()
    var score: (String, Int)
    
    func strScore() -> String {
        score.0
    }
    
    func intScore() -> Int {
        score.1
    }
    
    mutating func updateScore(str: String, val: Int) -> () {
        self.score.0 = str
        self.score.1 = val
    }
}
