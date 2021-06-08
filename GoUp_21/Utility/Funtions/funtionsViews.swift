//
//  funtionsViews.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 19/05/2021.
//

import SwiftUI
import UIKit

func heightScreem() -> CGFloat {
    return (UIScreen.main.bounds.height - 5 * 12) / 1.6
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
