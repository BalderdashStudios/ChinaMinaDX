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
    var speed: Double = 0.05
    @State private var displayCharacters = ""
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
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
    
    init(text: String, speed: Double = 0.05) {
        self.text = text
        self.speed = speed
        self.timer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()
    }
}

#Preview {
    
    TextEffect(text: "Hello")
}
