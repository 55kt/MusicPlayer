//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var compositions: [compositionModel] = [
        compositionModel(
            name: "The show must go on",
            data: Data(),
            artist: "Queen",
            coverImage: Data(),
            duration: 0348
        ),
        compositionModel(
            name: "Psychosocial",
            data: Data(),
            artist: "Slipknot",
            coverImage: Data(),
            duration: 0348
        )
    ]
}
