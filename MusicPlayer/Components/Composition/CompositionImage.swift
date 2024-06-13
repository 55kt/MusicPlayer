//
//  CompositionImage.swift
//  MusicPlayer
//
//  Created by Vlad on 13/6/24.
//

import SwiftUI

struct CompositionImage: View {
    
    //MARK: - Properties
    let imageData: Data?
    let size: CGFloat
    
    //MARK: - Body
    var body: some View {
        if let data = imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            ZStack {
                Color.gray
                    .frame(width: size, height: size)

                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .foregroundStyle(.white)
            }
            .cornerRadius(10)
        }
    }
}

#Preview {
    CompositionImage(imageData: Data(), size: 200)
}
