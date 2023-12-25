//
//  CircleBackgroundAnimation.swift
//  MovieBooking
//
//  Created by Pavel Andreev on 12/15/23.
//

import SwiftUI

struct CircleBackgroundAnimation: View {
    
    @Binding var animated: Bool
    
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animated ? 30 : 100)
                .offset(x: animated ? -50 : -130, y: animated ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animated.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: 100)
                .offset(x: animated ? 100 : 130, y: animated ? 150 : 100)
        }
    }
}

#Preview {
    CircleBackgroundAnimation(animated: .constant(false))
}
