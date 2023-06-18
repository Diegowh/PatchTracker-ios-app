//
//  imageView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI

struct ValorantImageView: View {
    var body: some View {
                NavigationLink(destination: EpisodeListView()) {
                        Image("valorant-logo")
                            .resizable()
                            .scaledToFill()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                            .background(Color(red: 1.0, green: 0.5, blue: 0.5))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }.padding(.horizontal)
                }
    }

struct ValorantImageView_Previews: PreviewProvider {
    static var previews: some View {
        ValorantImageView()
    }
}
