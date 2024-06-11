//
//  MediaPlayer.swift
//  MusicPlayer
//
//  Created by Vlad on 11/6/24.
//

import SwiftUI

struct MediaPlayer: View {
    
    //MARK: - Properties
    @State private var showFullPlayer = true
    
    var frameImage: CGFloat {
        showFullPlayer ? 320 : 60
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack {
                
                Spacer()
                
                // Mini Player
                HStack {
                    Color.white
                        .frame(width: frameImage, height: frameImage)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    if !showFullPlayer {
                        
                        VStack(alignment: .leading) {
                            Text("Artist Name").artistFont()
                            Text("Composition Name").compositionFont()
                        }
                        
                        Spacer()
                        CustomButton(image: "play.fill", size: .title) {
                            //
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
                        Text("Artist Name").artistFont()
                        Text("Composition Name").compositionFont()
                    }
                    VStack {
                        
                        // Duration
                        HStack {
                            Text("00:00")
                            Spacer()
                            Text("03:27")
                        }
                        .durationFont()
                        .padding()
                        
                        // Slider
                        Divider()
                        
                        HStack(spacing: 40) {
                            CustomButton(image: "backward.end.fill", size: .title2) {
                                //
                            }
                            CustomButton(image: "play.circle.fill", size: .largeTitle) {
                                //
                            }
                            CustomButton(image: "forward.end.fill", size: .title2) {
                                //
                            }
                            }
                        }
                        
                    }
                }
            .onTapGesture {
                withAnimation(.spring) {
                    self.showFullPlayer.toggle()
                }
            }
            
        }
    }
    
    //MARK: - Methods
    private func CustomButton(image: String, size: Font, action: @escaping () -> () ) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .foregroundStyle(.white)
                .font(size)
        }
    }
}

//MARK: - Preview
#Preview {
    MediaPlayer()
}
