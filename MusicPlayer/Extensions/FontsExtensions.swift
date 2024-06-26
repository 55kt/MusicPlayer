//
//  FontsExtensions.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct DurationFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
    }
}

extension View {
    func durationFont() -> some View {
        self.modifier(DurationFontModifier())
    }
}

extension Text {
    func artistFont () -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
    }
    
    func compositionFont () -> some View {
        self
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
}

// Preview Fonts
struct FontView: View {
    var body: some View {
        VStack {
            Text("Artist name")
                .artistFont()
            Text("Artist name")
                .compositionFont()
        }
    }
}

#Preview {
    FontView()
        .preferredColorScheme(.dark)
}
