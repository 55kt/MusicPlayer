//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

@main
struct MusicPlayerApp: App {
    
    //MARK: - Properties
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    
    var body: some Scene {
        WindowGroup {
            PlayerView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
