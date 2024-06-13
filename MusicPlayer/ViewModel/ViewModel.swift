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
    @Published var currentIndex: Int?
    @Published var currentTime: TimeInterval = 0.0
    @Published var totalTime: TimeInterval = 0.0
    
    var currentComposition: CompositionModel? {
        guard let currentIndex = currentIndex, compositions.indices.contains(currentIndex) else {
            return nil
        }
         return compositions[currentIndex]
    }
    
    //MARK: - Methods
    func playAudio(composition: CompositionModel) {
        do {
            self.audioPlayer = try AVAudioPlayer(data: composition.data)
            self.audioPlayer?.play()
            isPlaying = true
            totalTime = audioPlayer?.duration ?? 0.0
            if let index = compositions.firstIndex(where: { $0.id == composition.id }) {
                currentIndex = index
            }
        } catch {
            print("Error in audio playback: \(error.localizedDescription)")
        }
    }
    
    func playPause() {
        if isPlaying {
            self.audioPlayer?.pause()
        } else {
            self.audioPlayer?.play()
        }
        isPlaying.toggle()
    }
    
    func seekAudio(time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func updateProgress() {
        guard let player = audioPlayer else { return }
        currentTime = player.currentTime
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
