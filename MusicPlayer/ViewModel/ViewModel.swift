//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import Foundation
import SwiftUI
import AVFAudio

class ViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var compositions: [CompositionModel] = []
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    //MARK: - Methods
    func playAudio(composition: CompositionModel) {
        do {
            self.audioPlayer = try AVAudioPlayer(data: composition.data)
            self.audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error in audio playback: \(error.localizedDescription)")
        }
    }
    
    // Function for take a correct duration
    func timeIntervalToString(duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: duration) ?? ""
    }
    
    // Delete function
    func deleteComposition(composition: IndexSet) {
        compositions.remove(atOffsets: composition)
    }
}
