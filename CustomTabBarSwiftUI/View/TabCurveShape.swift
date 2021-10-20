//
//  TabCurve.swift
//  CustomTabBarSwiftUI
//
//  Created by Rakibul Hasan on 20/10/21.
//

import SwiftUI

struct TabCurveShape: Shape {
    //MARK: - PROPERTIES
    var tabPoint: CGFloat
    
    // animating path...
    var animatableData: CGFloat {
        get{ return tabPoint }
        set{ tabPoint = newValue }
    }
    
    //MARK: - FUNCTIONS
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            // Drawing curve path...
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = tabPoint
            
            path.move(to: CGPoint(x: mid - 40, y: rect.height))
            
            let to = CGPoint(x: mid, y: rect.height - 20)
            let control1 = CGPoint(x: mid - 15, y: rect.height)
            let control2 = CGPoint(x: mid - 15, y: rect.height - 20)
            
            let to1 = CGPoint(x: mid + 40, y: rect.height)
            let control3 = CGPoint(x: mid + 15, y: rect.height - 20)
            let control4 = CGPoint(x: mid + 15, y: rect.height)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}

//MARK: - PREVIEW
struct TabCurveShape_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
