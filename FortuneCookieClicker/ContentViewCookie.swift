//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
import Combine
struct ContentViewCookie: View
{
    @State private var isLoggedIn = false
    @State private var screen2 = false
    @State private var isPressTwo: Bool = false
    @State private var isBarDone: Bool = true
    @State private var counter = 0
    @State private var counter1 = 0
    @State private var progress: CGFloat = 0.0
    @State private var progress2: CGFloat = 0.0
    @State private var falling: CGFloat = -700.0
    @State private var falling1: CGFloat = -100.0
    @State private var falling2: CGFloat = -1000.0
    @State private var falling3: CGFloat = -100.0
    @State private var falling4: CGFloat = -1300.0
    @State private var falling5: CGFloat = -20.0
    @State private var rateOfFall: CGFloat = 6.0
    @State private var rateOfFall1: CGFloat = 5.0
    @State private var rateOfFall2: CGFloat = 7.0
    @State private var timeLeft = 10
    @State private var gravity = 9.81
    @State private var china = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    let timer1 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    //Ider is a chud
    var body: some View {
        Text("Time left (Seconds): " + String(timeLeft))
            .font(.largeTitle)
            .onReceive(timer, perform:  { time in
                if timeLeft>=0{
                    self.timeLeft -= 1
                    isPressTwo = true
                }
            })
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 300, height: 20)
                .opacity(0.3)
                .foregroundColor(.gray)
            Rectangle()
                .frame(width: progress2 * 300, height: 20)
                .foregroundColor(.green)
                .animation(.easeInOut, value: progress2)
        }
        Button(){
            falling4 = -900.0
            falling5 = CGFloat.random(in: -100.0...100.0)
            progress2+=0.01
        }
        label: {
            Image("Cookies")
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 100, height: 100)
        }
        .offset(y: falling4)
        .offset(x: falling5)
        .font(.largeTitle)
        .onReceive(timer2, perform:  { time in
            self.falling4 += rateOfFall
            if falling4 > 600.0{
                falling4 = -900.0
                falling5 = CGFloat.random(in: -150.0...150.0)
            }
        })
        
        Button(){
            falling = -900.0
            falling1 = CGFloat.random(in: -100.0...100.0)
            progress2+=0.01
            
        }
        label: {
            Image("Cookies")
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 100, height: 100)
        }
        .offset(y: falling)
        .offset(x: falling1)
        .font(.largeTitle)
        .onReceive(timer2, perform:  { time in
            self.falling += rateOfFall
            if falling > 600.0{
                falling = -900.0
                falling1 = CGFloat.random(in: -150.0...150.0)
            }
        })
        
        Button(){
            falling2 = -900.0
            falling3 = CGFloat.random(in: -100.0...100.0)
            progress2+=0.01
            
            
        }
        label: {
            Image("Cookies")
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 100, height: 100)
        }
        .offset(y: falling2)
        .offset(x: falling3)
        .font(.largeTitle)
        .onReceive(timer2, perform:  { time in
            self.falling2 += rateOfFall1
            if falling2 > 600.0{
                falling2 = -900.0
                falling3 = CGFloat.random(in: -150.0...150.0)
                
            }
        })
    
    if timeLeft==0{
    }
    }
}
#Preview{
    ContentViewCookie()
}


