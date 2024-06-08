//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct PlayerView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            CompositionCell(composition: compositionModel(name: "1", data: Data(), artist: "2", coverImage: Data(), duration: 0))
        }
    }
}

#Preview {
    PlayerView()
        .preferredColorScheme(.dark)
}
