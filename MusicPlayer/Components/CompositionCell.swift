//
//  CompositionCell.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct CompositionCell: View {
    
    var composition: compositionModel
    
    var body: some View {
        List {
            HStack {
                Color.white
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(composition.artist ?? "Unknow Artist").artistName()
                    Text(composition.name).compositionName()
                }
                Spacer()
                Text("03:44").compositionName()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    CompositionCell(composition: compositionModel(name: "Bambarbia", data: Data(), artist: "Kergudu", coverImage: Data(), duration: 0))
        .preferredColorScheme(.dark)
}
