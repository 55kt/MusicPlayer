//
//  BackgroundView.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.black, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
