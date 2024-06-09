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
    
    //MARK: - Body
    var body: some View {
            HStack {
                Color.white
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(composition.artist ?? "Unknow Artist").artistFont()
                    Text(composition.name).compositionFont()
                }
                Spacer()
                Text("03:44").compositionFont()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

//MARK: - Preview
#Preview {
    CompositionCell(composition: CompositionModel(name: "Bambarbia", data: Data(), artist: "Kergudu", coverImage: Data(), duration: 0))
        .preferredColorScheme(.dark)
}
