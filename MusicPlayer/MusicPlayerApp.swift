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
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true // Dark theme condition
    @StateObject var vm = ViewModel()
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            PlayerView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light) // Dark theme condition
        }
    }
}
