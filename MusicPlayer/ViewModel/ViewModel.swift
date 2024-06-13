//
//  ViewModel.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import Foundation
import SwiftUI
import AVFAudio

class ViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
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
            self.audioPlayer?.delegate = self
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
    
    func forward() {
        guard let currentIndex = currentIndex else { return }
        let nextIndex = currentIndex + 1 < compositions.count ? currentIndex + 1 : 0
        playAudio(composition: compositions[nextIndex])
    }
    
    func backward() {
        guard let currentIndex = currentIndex else { return }
        let previousIndex = currentIndex > 0 ? currentIndex - 1 : compositions.count - 1
        playAudio(composition: compositions[previousIndex])
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
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            forward()
        }
    }
    
    // Delete function
    func deleteComposition(composition: IndexSet) {
        stopAudio()
        compositions.remove(atOffsets: composition)
    }
    
    func stopAudio() {
        self.audioPlayer?.stop()
        self.audioPlayer = nil
        isPlaying = false
    }
}


