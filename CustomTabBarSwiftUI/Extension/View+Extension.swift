//
//  View+Extension.swift
//  CustomTabBarSwiftUI
//
//  Created by Rakibul Hasan on 20/10/21.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
