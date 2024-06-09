//
//  Model.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import Foundation

struct CompositionModel: Identifiable {
    var id = UUID()
    var name: String
    var data: Data
    var artist: String?
    var coverImage: Data?
    var duration: TimeInterval?
}
