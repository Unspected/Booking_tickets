//
//  HomeView.swift
//  MovieBooking
//
//  Created by Pavel Andreev on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var animated: Bool = false
    @State var posters1: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]

    @State var posters2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]

    @State var posters3: [String] = ["poster13", "poster14", "poster15", "poster16", "poster17", "poster18"]
    
    var body: some View {
        ZStack {
            CircleBackgroundAnimation(animated: $animated)
            
          VStack(spacing: 0.0) {
            Text("Choose Movie")
              .fontWeight(.bold)
              .font(.title3)
              .foregroundColor(.white)
              
            CustomSearchBar()
                  .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 30))
              
              ScrollView(.vertical, showsIndicators: false) {
                  VStack {
                      ScrollSection(title: "Now Playing", posters: posters1)
                      ScrollSection(title: "Coming Soon", posters: posters2)
                      ScrollSection(title: "Top Movies", posters: posters3)
                      ScrollSection(title: "Favorite", posters: posters1)
                  }
                  .padding(.bottom, 90)
              }
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
          LinearGradient(
            gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]),
            startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    HomeView()
}
