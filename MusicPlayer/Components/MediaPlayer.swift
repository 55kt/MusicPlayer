//
//  MediaPlayer.swift
//  MusicPlayer
//
//  Created by Vlad on 11/6/24.
//

import SwiftUI

struct MediaPlayer: View {
    
    //MARK: - Properties
    @State private var showFullPlayer = false
    @Namespace private var playerAnimation
    @EnvironmentObject var vm: ViewModel
    @Binding var showNavBar: Bool
    //    @State private var isDragging = false
    
    var frameImage: CGFloat {
        showFullPlayer ? 320 : 60
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            if vm.currentComposition != nil {
                
                Player()
                
                .frame(height: showFullPlayer ? UIScreen.main.bounds.height + 2000 : 70)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        self.showFullPlayer.toggle()
                        self.showNavBar.toggle()
                    }
                }
            }
            
            
        }
    }
    
    //MARK: - Methods
    @ViewBuilder
    private func Player() -> some View {
        VStack {
            // Mini Player
            HStack {
                // Cover
                if let data = vm.currentComposition?.coverImage, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: frameImage, height: frameImage)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack {
                        Color.gray
                            .frame(width: frameImage, height: frameImage)

                        Image(systemName: "music.note")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundStyle(.white)
                    }
                    .cornerRadius(10)
                }
                
                if !showFullPlayer {
                    // Description
                    VStack(alignment: .leading) {
                        CompositionDescription()
                    }
                    .matchedGeometryEffect(id: "Description", in: playerAnimation)
                    
                    Spacer()
                    CustomButton(image: vm.isPlaying ? "pause.fill" : "play.fill", size: .title) {
                        vm.playPause()
                    }
                }
            }
            .padding()
            .background(.black.opacity(0.3))
            .cornerRadius(10)
            .padding()
            
            // Full Player
            
            if showFullPlayer {
                
                // Description
                VStack {
                    CompositionDescription()
                }
                .matchedGeometryEffect(id: "Description", in: playerAnimation)
                .padding(.top)
                
                VStack {
                    // Duration
                    HStack {
                        Text("\(vm.timeIntervalToString(duration: vm.currentTime))")
                        Spacer()
                        Text("\(vm.timeIntervalToString(duration: vm.totalTime))")
                    }
                    .durationFont()
                    .padding()
                    
                    // Slider
                    Slider(value: $vm.currentTime, in: 0...vm.totalTime) { editing in
//                            isDragging = editing
                        
                        if !editing {
                            vm.seekAudio(time: vm.currentTime)
                        }
                    }
                    .offset(y: -18)
                    .accentColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            vm.updateProgress()
                        }
                    }
                    
                    HStack(spacing: 40) {
                        CustomButton(image: "backward.end.fill", size: .title2) {
                            //
                        }
                        CustomButton(image: vm.isPlaying ? "pause.circle.fill" : "play.circle.fill", size: .largeTitle) {
                            vm.playPause()                        }
                        CustomButton(image: "forward.end.fill", size: .title2) {
                            //
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
    
    private func CustomButton(image: String, size: Font, action: @escaping () -> () ) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .foregroundStyle(.white)
                .font(size)
        }
    }
    
    @ViewBuilder
    private func CompositionDescription() -> some View {
        if let currentComposition = vm.currentComposition {
            Text(currentComposition.artist ?? "Unknow Artist").artistFont()
            Text(currentComposition.name).compositionFont()
        }
    }
}

//MARK: - Preview
#Preview {
    MediaPlayer(showNavBar: .constant(false))
        .environmentObject(ViewModel())
}
