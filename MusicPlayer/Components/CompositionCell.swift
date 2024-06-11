//
//  CompositionCell.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct CompositionCell: View {
    
    //MARK: - Properties
    var composition: CompositionModel
    let durationFormatted: (TimeInterval) -> String
    
    //MARK: - Body
    var body: some View {
            HStack {
                if let data = composition.coverImage, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack {
                        Color.gray
                            .frame(width: 60, height: 60)

                        Image(systemName: "music.note")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundStyle(.white)
                    }
                    .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Text(composition.artist ?? "Unknow Artist").artistFont()
                    Text(composition.name).compositionFont()
                }
                Spacer()
                if let duration = composition.duration {
                    Text(durationFormatted(duration))
                        .artistFont()
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}
