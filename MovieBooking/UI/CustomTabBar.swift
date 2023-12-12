//
//  CustomTabBar.swift
//  MovieBooking
//
//  Created by Pavel Andreev on 12/11/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        
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
                    })
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(.red)
        
    }
}

#Preview {
    ContentView()
}
