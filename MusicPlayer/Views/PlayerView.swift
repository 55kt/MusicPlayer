//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct PlayerView: View {
    
    //MARK: - Properties
    @State private var showNavBar = true
    @StateObject var vm = ViewModel()
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                if showNavBar {
                    NavigationBar(navTitle: "Music App",buttonTextName: nil, buttonImage: "plus.circle")
                }
                
                ListView()
                
                MediaPlayer(showNavBar: $showNavBar)
                }
            }
        }
    }

//MARK: - Preview
#Preview {
    PlayerView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
