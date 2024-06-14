//
//  ListView.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @ObservedResults(CompositionModel.self) var compositions
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(compositions) { composition in
                CompositionCell(composition: composition, durationFormatted: vm.timeIntervalToString)
                    .onTapGesture {
                        vm.playAudio(composition: composition)
                    }
            }
            .onDelete(perform: $compositions.remove)
        }
        .listStyle(.plain)
        .overlay(
            CustomDivider()
        )
        .padding(.vertical, 1)
        .padding(.bottom, 90)
        .frame(maxHeight: .infinity)
    }
}

//MARK: - Preview
#Preview {
    PlayerView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
