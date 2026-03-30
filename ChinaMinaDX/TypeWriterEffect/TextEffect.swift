//
//  TextEffect.swift
//  ChinaMinaDX
//
//  Created by Harvey Gilman  on 3/29/26.
//
import SwiftUI
internal import Combine

struct TextEffect: View {
    
    let text: String
    @State private var displayCharacters = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text(displayCharacters)
        //.font(Font. custom( "Bebas Neue", size: 45))
        //.bold()
            .onReceive(timer) { _ in
                if displayCharacters.count < text.count {
                    let index = text.index(text.startIndex, offsetBy:
                                            displayCharacters.count)
                    displayCharacters.append(text[index])
                }
            }
    }
}
#Preview {
    
    TextEffect(text: "Hello")
}
