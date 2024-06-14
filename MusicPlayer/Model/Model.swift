//
//  Model.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import Foundation
import RealmSwift

//struct CompositionModel: Identifiable {
//    var id = UUID()
//    var name: String
//    var data: Data
//    var artist: String?
//    var coverImage: Data?
//    var duration: TimeInterval?
//}

class CompositionModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var data: Data
    @Persisted var artist: String?
    @Persisted var coverImage: Data?
    @Persisted var duration: TimeInterval?
    
    convenience init(name: String, data: Data, artist: String? = nil, coverImage: Data? = nil, duration: TimeInterval? = nil) {
        self.init()
        self.name = name
        self.data = data
        self.artist = artist
        self.coverImage = coverImage
        self.duration = duration
    }
}
