//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var compositions: [CompositionModel] = []
}
