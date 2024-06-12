//
//  CustomDivider.swift
//  MusicPlayer
//
//  Created by Vlad on 12/6/24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        VStack {
            Divider()
                .frame(height: 1)
                .background(
                    LinearGradient (
                        gradient: Gradient(colors: [.black, Color.blue]),
                        startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                        endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                    )
                )
            Spacer()
            Divider()
                .frame(height: 1)
                .background(
                    LinearGradient (
                        gradient: Gradient(colors: [.blue, Color.black]),
                        startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                        endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                    )
                )
        }
    }
}

#Preview {
    CustomDivider()
}
