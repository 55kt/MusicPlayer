//
//  ImportFileManager.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import Foundation
import SwiftUI
import AVFoundation
import RealmSwift

/// Import file manager allows you to select audio files and import them into the application
struct ImportFileManager: UIViewControllerRepresentable {
    
    
    /// Manages tasks between swift ui and ui kit
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    /// A method that creates and configures a UIDocumentPickerViewController that is used to select audio files
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        
        /// Allowing the file type "public.audio" to open (MP3, WAV)
        let picker = UIDocumentPickerViewController(documentTypes: ["public.audio"], in: .open)
        
        /// Allowing to take only one file
        picker.allowsMultipleSelection = true
        
        /// Show file extension method
        picker.shouldShowFileExtensions = true
        
        /// Using a Coordinator as a Delegate
        picker.delegate = context.coordinator
        
        return picker
    }
    
    /// The method is intended to update the controller with new data. In this case, it is empty since all settings were made during creation.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    /// Coordinator links UiDocumentPicker and ImportFileManager
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        //MARK: - Properties
        /// Link to the parent component ImportFileManager so that you can interact with it
        var parent: ImportFileManager
        @ObservedResults(CompositionModel.self) var compositions
        
        //MARK: - Initializer
        init(parent: ImportFileManager) {
            self.parent = parent
        }
        
        //MARK: - Methods
        /// This method is called when the user selects a document (an audio file in our case)
        /// The method processes the selected URL and creates a composition of type CompositionModel and then adds the composition to the compositions array
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            
            for url in urls {
                /// Safely retrieves the first element from the urls array. If the array is empty then urls.first will return nil and the condition will not be passed
                /// After retrieving the url, the startAccessingSecurityScopedResource method is called to begin accessing the protected resource
                guard url.startAccessingSecurityScopedResource() else { continue }
                
                do {
                    /// Ensures that the stopAccessingSecurityScopedResource method will be called when documentPicker execution completes regardless
                    /// whether the operation was performed successfully or not. And the security resource will be successfully closed and correctly released from memory
                    defer { url.stopAccessingSecurityScopedResource() }
                    /// Getting file Data
                    let documetn = try Data(contentsOf: url)
                    
                    /// Creating AVAsset to extract metadata
                    let asset = AVAsset(url: url)
                    
                    /// Initialize the object CompositionModel
                    var composition = CompositionModel(name: url.lastPathComponent, data: documetn)
                    
                    /// Loop to iterate over audio file metadata to extract (artist, cover, title)
                    let metadata = asset.metadata
                    for item in metadata {
                        guard let key = item.commonKey?.rawValue, let value = item.value else { continue }
                        
                        /// Checks if a file has metadata via key/value
                        switch key {
                        case AVMetadataKey.commonKeyArtist.rawValue:
                            composition.artist = value as? String
                        case AVMetadataKey.commonKeyArtwork.rawValue:
                            composition.coverImage = value as? Data
                        case AVMetadataKey.commonKeyTitle.rawValue:
                            composition.name = value as? String ?? composition.name
                        default:
                            break
                        }
                    }
                    
                    /// Getting duration of composition
                    composition.duration = CMTimeGetSeconds(asset.duration)
                    
                    let isDuplicate = compositions.contains { $0.name == composition.name && $0.artist == composition.artist }
                    
                    /// Adding a composition to the array if it is not there yet
                    if !isDuplicate {
                        $compositions.append(composition)
                    } else {
                        print ("Composition with the same name is already exists")
                    }
                } catch {
                    print ("Error processing the file: \(error)")
                }
                
            }
        }
    }
}
