//
//  StatusView.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 05/05/2021.
//

import SwiftUI
import Foundation

var aa = GlobalNPS(aStatus: [needNPS]())

struct StatusView: View {
    var dataStatus: (String, Int)
    
    var body: some View {
        VStack {
            Text(dataStatus.0)
                .frame(width: 90)
                .foregroundColor(.white)
                .font(.system(size: 14))
            Text(String(dataStatus.1))
                .frame(width: 90)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.top, 5)
                .padding(.bottom, 5)
        }
        .frame(width: 90, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.init(hexStringToUIColor(hex: "#181F24")))
        .cornerRadius(15)
        .padding(5)
    }
    
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HStack {
                ForEach(aa.aStatus, id: \.id) { need in
                    StatusView(dataStatus: need.score)
                }
            }
        }
        
    }
}
