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
            
            CompositionCell()
        }
    }
}

#Preview {
    PlayerView()
        .preferredColorScheme(.dark)
}
