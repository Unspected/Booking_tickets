//
//  CustomTabBar.swift
//  MovieBooking
//
//  Created by Pavel Andreev on 12/11/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    
    var backgroundColors: [Color] = [Color("purple"), Color("lightBlue"), Color("pink")]
    var gradientCircle: [Color] = [Color("cyan"), Color("cyan").opacity(0.1), Color("cyan")]
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(spacing: 0.0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button(
                        action: {
                            withAnimation(.easeInOut) {
                                currentTab = tab
                            }
                        },
                        label: {
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                // Animation move icon to top
                                .offset(y: currentTab == tab ? -17 : 0)
                        })
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 10)
                    .offset(x: indicatorOffSet(width: width), y: -17)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(
                                LinearGradient(colors: gradientCircle,
                                               startPoint: .top,
                                               endPoint: .bottom), style: StrokeStyle(lineWidth: 2)
                            )
                            .rotationEffect(.degrees(135))
                            .frame(width: 78, height: 78)
                            .offset(x: indicatorOffSet(width: width), y: -17)
                    )
            }
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: backgroundColors, startPoint: .leading, endPoint: .trailing))
        
    }
    
    func indicatorOffSet(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 { return 0 }
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home: 0
        case .location: 1
        case .ticket: 2
        case .category: 3
        case .profile: 4
        }
    }
}

#Preview {
    ContentView()
}
