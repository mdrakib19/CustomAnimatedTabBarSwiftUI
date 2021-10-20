//
//  Home.swift
//  CustomTabBarSwiftUI
//
//  Created by Rakibul Hasan on 20/10/21.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERTIES
    @State var selectedTab = "house"
    
    //MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.purple
                .ignoresSafeArea()
            
            // Custom Tab Bar...
            
            CustomTabBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}

//MARK: - PREVIEW
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
