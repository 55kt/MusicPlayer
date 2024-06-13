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
                CompositionImage(imageData: composition.coverImage, size: 60)
                
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
