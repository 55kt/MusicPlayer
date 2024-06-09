//
//  NavigationBar.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import SwiftUI

struct NavigationBar: View {
    
    //MARK: - Properties
    let navTitle: String
    let buttonTextName: String?
    let buttonImage: String?
    @State var showFiles = false
    @EnvironmentObject var vm: ViewModel
    
    //MARK: - Body
    var body: some View {
        
       BackgroundView()
        
            // Custom Navigation Bar Title
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text(navTitle)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
                
                // Custon Navigation Bar Button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFiles.toggle()
                    } label: {
                        if let buttonTextName = buttonTextName {
                            Text(buttonTextName)
                                .font(.headline)
                                .foregroundStyle(.white)
                        } else if let buttonImage = buttonImage, !buttonImage.isEmpty {
                            Image(systemName: buttonImage)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .sheet(isPresented: &showFiles, content: {
                    ImportFileManager(compositions: $vm.compositions)
                })
            }
    }
}


//MARK: - Preview
#Preview {
    NavigationStack {
        NavigationBar(navTitle: "Nav Title Name",buttonTextName: nil, buttonImage: "plus")
    }
        .preferredColorScheme(.dark)
        .environmentObject(ViewModel())
}
