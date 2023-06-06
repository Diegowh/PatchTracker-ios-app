//
//  imageView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct imageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1.0, green: 0.3, blue: 0.3)
                    .edgesIgnoringSafeArea(.all)

                NavigationLink(destination: EpisodeListView()) {
                        Image("valorant-logo")
                            .resizable()
                            .scaledToFill()
                            .scaledToFit()
                            .padding()
                            .background(Color(red: 1.0, green: 0.5, blue: 0.5))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }.padding(.horizontal)
                }
        }
        }
    }

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
