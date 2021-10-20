//
//  CustomTabBarView.swift
//  CustomTabBarSwiftUI
//
//  Created by Rakibul Hasan on 20/10/21.
//

import SwiftUI

struct CustomTabBarView: View {
    //MARK: - PROPERTIES
    @Binding var selectedTab: String
    
    // Storing each tab midpoint to animate it in future...
    @State var tabPoints: [CGFloat] = []
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Buttons...
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "message", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "gearshape", selectedTab: $selectedTab, tabPoints: $tabPoints)
        } //:HSTACK
        .padding()
        .background(
            Color.white
                .clipShape(TabCurveShape(tabPoint: getCurvePoint() - 2.5))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 7.5)
            
            ,alignment: .bottomLeading
        )
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
    
    // extracting point...
    func getCurvePoint() -> CGFloat {
        // if toppoint is empty
        if tabPoints.isEmpty {
            return 10
        }
        else {
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "person":
                return tabPoints[1]
            case "message":
                return tabPoints[2]
            default:
                return tabPoints[3]
            }
        }
    }
}

//MARK: - PREVIEW
struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabBarButton: View {
    //MARK: - PROPERTIES
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    //MARK: - BODY
    var body: some View {
        // For getting mid point of each button for curve animation
        GeometryReader { reader -> AnyView in
            // extracting midpoint and storing
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                // avoiding junk data
                
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                Button {
                    // Changing tab...
                    // Spring animation...
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                } label: {
                    // Change image if it's selected
                    
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color.purple)
                        .offset(y: selectedTab == image ? -10 : 0)
                } //: BUTTON
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        } //: GEOMETRY
        .frame(height: 50)
    }
}
