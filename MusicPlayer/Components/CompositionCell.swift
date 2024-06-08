//
//  CompositionCell.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct CompositionCell: View {
    var body: some View {
        List {
            HStack {
                Color.white
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Queen").artistName()
                    Text("The show must go on").compositionName()
                }
                Spacer()
                Text("03:48").compositionName()
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    CompositionCell()
        .preferredColorScheme(.dark)
}
