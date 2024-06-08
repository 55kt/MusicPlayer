//
//  Model.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import Foundation

struct compositionModel: Identifiable {
    let id = UUID()
    let name: String
    let data: Data
    let artist: String?
    let coverImage: Data?
    let duration: TimeInterval?
}
