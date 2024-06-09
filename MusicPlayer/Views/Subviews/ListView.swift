//
//  ListView.swift
//  MusicPlayer
//
//  Created by Vlad on 9/6/24.
//

import SwiftUI

struct ListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(vm.compositions) { composition in
                CompositionCell(composition: composition)
            }
        }
        .listStyle(.plain)
    }
}

//MARK: - Preview
#Preview {
    ListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
