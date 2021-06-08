//
//  nps.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 07/05/2021.
//

import SwiftUI

struct nps: View {
    var statusNPS: Float
//    @EnvironmentObject var npsG: GlobalNPS
    
    var body: some View {
        VStack {
            dateUpdate()
            
            HStack(alignment: .center) {
                Text("\(String(format: "%.1f", statusNPS))")
                    .fontWeight(.thin)
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .transition(.opacity)
                Text("%")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            .padding(.bottom, heightScreem()/13)
            .padding(.top, heightScreem()/20)
        }
    }
}

struct nps_Previews: PreviewProvider {
    static var previews: some View {
        nps(statusNPS: 0)
    }
}
