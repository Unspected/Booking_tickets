

import SwiftUI

struct TicketView: View {
    
    @State var animated: Bool = false
    
    var body: some View {
        ZStack {
            CircleBackgroundAnimation(animated: $animated)
            
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
