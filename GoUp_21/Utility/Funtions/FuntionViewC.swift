import Foundation
import UIKit

func calcNPS(promotor: Float, neutro: Float, detractor: Float) -> Float {
    let resultNPS = ((promotor - detractor)/(promotor + neutro + detractor)) * 100
    return resultNPS
}

func statusNpsrange(statusNPS: Float) -> String {
    var npsRange = String()
    if statusNPS < 48.5 {
        npsRange = "Inadecuado"
    } else if statusNPS > 48.5 && statusNPS < 65.1 {
        npsRange = "Mejorar"
    } else if 75.1 > statusNPS && statusNPS > 65.1 {
        npsRange = "Adecuado"
    } else if statusNPS < 82.3 && statusNPS > 75.1 {
        npsRange = "Destacado"
    } else if statusNPS > 82.3 {
        npsRange = "Sobresaliente"
    }
    return npsRange
}

func calcNPS_Spect (promotor: Float, neutro: Float, detractor: Float,
                    score_act: Float) -> [needNPS] {
    var stats: [String: Int] = ["Adecuado": 0, "Destacado": 0, "Sobresal": 0]
    var count: Int = Int(promotor)
    var score = 0
    let needs = GlobalNPS(aStatus: [needNPS]())
    
    var scoreAux: Float = calcNPS(promotor: promotor, neutro: neutro, detractor: detractor)
    
    while scoreAux < 82.5 {
        if scoreAux < 65.1 {
            count += 1
            stats.updateValue(score, forKey: "Adecuado")
        } else if (75.1 > scoreAux) && (scoreAux >= 65.1) {
            count += 1
            stats.updateValue(score, forKey: "Destacado")
        } else if (82.5 >= scoreAux) && (scoreAux >= 75.1) {
            count += 1
            stats.updateValue(score, forKey: "Sobresal")
        }
        score = count - Int(promotor)
        scoreAux = calcNPS(promotor: Float(count), neutro: neutro, detractor: detractor)
    }
    
    needs.changeValueScore(list: &needs.aStatus, key: "Adecuado", val: stats["Adecuado"]!)
    needs.changeValueScore(list: &needs.aStatus, key: "Destacado", val: stats["Destacado"]!)
    needs.changeValueScore(list: &needs.aStatus, key: "Sobresal", val: stats["Sobresal"]!)
    
    return needs.aStatus
}

func correctInput (wordSearch: String, wordABC: String) -> Bool {
    var correct: Bool = false
    var inputRec: Int = 0
    let length: Int = wordSearch.count
    var wordSelect: String.Index
    var wordDump: String
    
    while ((correct == false) && inputRec < length)  {
        wordSelect = wordSearch.index(wordSearch.startIndex, offsetBy: inputRec)
        wordDump = String(wordSearch[wordSelect])
        if (wordABC.contains(wordDump)) {
            correct = true
        } else {
            inputRec += 1
        }
    }
    return correct
}

