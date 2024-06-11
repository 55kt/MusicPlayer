//
//  ListView.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import SwiftUI

struct ListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(vm.compositions) { composition in
                CompositionCell(composition: composition, durationFormatted: vm.timeIntervalToString)
                    .onTapGesture {
                        vm.playAudio(composition: composition)
                    }
            }
            .onDelete(perform: vm.deleteComposition)
        }
        .listStyle(.plain)
    }
}

//MARK: - Preview
#Preview {
    PlayerView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
