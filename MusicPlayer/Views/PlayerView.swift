//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Vlad on 8/6/24.
//

import SwiftUI

struct PlayerView: View {
    
    //MARK: - Properties
    @StateObject var vm = ViewModel()
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                NavigationBar(navTitle: "Music App",buttonTextName: nil, buttonImage: "plus.circle")
                
                BackgroundView()
                
                ListView()
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
