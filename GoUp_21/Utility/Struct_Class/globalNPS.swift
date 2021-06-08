//
//  global.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 20/05/2021.
//

import Foundation

// Env object
class GlobalNPS: ObservableObject {
    @Published var npsPrincipal: Float = 0.0
    @Published var inputDect: String = ""
    @Published var inputNeut: String = ""
    @Published var inputProm: String = ""
    
    @Published var aStatus: [needNPS]// = [needNPS]()
    
    init(aStatus: [needNPS]) {
        var aa = [needNPS]()
        aa.append(needNPS(score: ("Adecuado", 0)))
        aa.append(needNPS(score: ("Destacado", 0)))
        aa.append(needNPS(score: ("Sobresal", 0)))
        
        self.aStatus = aa
    }
    
    func printnps() -> () {
        print(npsPrincipal)
        print(aStatus)
        print("\(inputDect), \(inputNeut), \(inputProm)")
    }
    
    // Calculates the NPS and what is necessary to be in Sobresaliente
    func globalCalcNPS (promotor: Float, neutro: Float, detractor: Float) -> () {
        npsPrincipal = calcNPS(promotor: promotor,
                               neutro: neutro,
                               detractor: detractor)
        aStatus = calcNPS_Spect(promotor: promotor,
                                neutro: neutro,
                                detractor: detractor,
                                score_act: npsPrincipal)
    }
    
    // Returns the position of the element in the list
    func posElemScore(list: [needNPS], find: String) -> Int {
        var pos: Int = 0
        var stop: Bool = false
        
        while pos < list.count && !stop {
            if (list[pos].strScore() == find) {
                stop = true
            }
            pos += 1
        }
        
        pos -= 1

        return pos
    }
    
    // Change value specificated in the List
    func changeValueScore(list: inout[needNPS], key: String, val: Int) -> () {
        let position: Int = posElemScore(list: list, find: key)
        
        list[position].updateScore(str: key, val: val)
    }
    
    func verifInputs() -> Bool {
        return inputDect.isEmpty || inputNeut.isEmpty || inputProm.isEmpty
    }
}
