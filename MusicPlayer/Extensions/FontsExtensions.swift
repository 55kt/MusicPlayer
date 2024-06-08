//
//  FontsExtensions.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

extension Text {
    func artistName () -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
    }
    
    func compositionName () -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
}

struct FontView: View {
    var body: some View {
        VStack {
            Text("Artist name")
                .artistName()
            Text("Artist name")
                .compositionName()
        }
    }
}

#Preview {
    FontView()
        .preferredColorScheme(.dark)
}
