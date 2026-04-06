//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
internal import Combine
struct Cookie: Identifiable{
    
    
    let id: Int
    var x: CGFloat
    var y: CGFloat
    var speed: CGFloat
    mutating func fall(screenHeight: CGFloat = 600){
        y += speed
        if y > screenHeight{
            reset()
        }
    }
    mutating func reset(){
        y = -900
        x=CGFloat.random(in: -150...150)
    }
    mutating func thwart(){
        reset()
    }
    
    
}
struct ContentViewCookie: View
{
    @StateObject private var notificationManager = NotificationManager()
    @Binding var screen4: Bool
    @Binding var userWinState: Int
    @State private var cookiesThwarted = 0
    @State private var timeLeft = 10
    //Ider is a chud
    //harvey is undeserving of life
    
    @State private var cookies: [Cookie] = [
        Cookie(id: 0, x: -100, y: -700, speed: 6.0),
        Cookie(id: 1, x: -20, y: -1300,  speed: 6.0),
        Cookie(id: 2, x: -100, y: -1000, speed: 5.0),
    ]
    let timer  = Timer.publish(every: 1,    on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.black
            VStack {
                Text("Time left: \(timeLeft) seconds.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .onReceive(timer) { _ in
                        if timeLeft > 0 {
                            timeLeft -= 1
                        }
                    }
                
                Text("Cookies Thwarted: \(cookiesThwarted)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            ForEach($cookies) { $cookie in
                Button {
                    cookiesThwarted += 1
                    cookie.thwart()
                } label: {
                    Image("Cookies")
                        .resizable()
                        .interpolation(.none)
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                }
                .offset(x: cookie.x, y: cookie.y)
            }
        }
        .ignoresSafeArea()
        .onReceive(timer2) { _ in
            for i in cookies.indices {
                cookies[i].fall()
            }
            checkGameOver()
        }
    }
    private func checkGameOver(){
        if timeLeft==0{
            if cookiesThwarted >= 3{
                userWinState += 1
            }
            screen4=true
        }
    }
}//
#Preview{
    ContentViewCookie(screen4: .constant(false),userWinState: .constant(1))
}


