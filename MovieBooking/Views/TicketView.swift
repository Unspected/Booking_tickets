

import SwiftUI

struct TicketView: View {
    
    @State var animated: Bool = false
    
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
            
            VStack(spacing: 30.0) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Text("Once a buy new ticket simply scan the bardcode to access your movie")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Tickets()
                .padding(.top, 30)
        }
        .background(
            LinearGradient(
                gradient:
                    Gradient(colors:[Color("backgroundColor"), Color("backgroundColor2")]),
                startPoint: .top,
                endPoint: .bottom))
    }
}

#Preview {
    TicketView()
}
