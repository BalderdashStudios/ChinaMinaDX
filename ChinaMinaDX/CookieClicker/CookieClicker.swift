//
//  CookieClicker.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/26/26.
//
import SwiftUI
internal import Combine
import Vortex

struct CookieClicker: View {
    
    @State public var loseTimer = 10
    @State public var counter = 10
    
    @State private var progress2 = 0.0
    
    @State private var cookieState = "Cookie"
    
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            if loseTimer > 0{
                
                if counter > 0 {
                    Text("Uploading Data: " + String(loseTimer) + " Seconds Left.")
                        .onReceive(timer2, perform: {time in
                            if counter > 0 {
                                loseTimer -= 1
                            }
                        })
                       // .font(Font.custom("Retro Gaming", size: 20))
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.red))
                        .foregroundColor(.black)
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: 300, height: 20)
                            .opacity(0.3)
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .frame(width: progress2 * 300, height: 20)
                            .foregroundColor(.green)
                            .animation(.easeInOut, value: progress2)
                        
                            .onReceive(timer2) { _ in
                                if progress2 < 1.0 {
                                    progress2 += 0.1
                                }
                            }
                    }
                    
                    VortexViewReader { proxy in
                    Text("COOKIES LEFT = " + String(counter))
                      //  .font(Font.custom("Retro Gaming", size: 40))
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                        .foregroundColor(.black)
                    Text("REMOVE COOKIES")
                       // .font(Font.custom("Retro Gaming", size: 40))
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                        .foregroundColor(.black)
                   ZStack() {
                       VortexView(VortexSystem(
                        tags: ["square", "circle"],
                        birthRate: 0,
                        lifespan: 2,
                        speed: 0.7,
                        speedVariation: 0.5,
                        angleRange: .degrees(90),
                        acceleration: [0, 1],
                        angularSpeedVariation: [4, 4, 4],
                        colors: .random(.orange, .brown),
                        size: 0.5,
                        sizeVariation: 0.5
                    )) {
                           Rectangle()
                               .fill(.orange)
                               .frame(width: 16, height: 16)
                               .tag("square")
                           
                           Circle()
                               .fill(.orange)
                               .frame(width: 16)
                               .tag("circle")
                       }
                       .zIndex(1)
                       .allowsHitTesting(false)
                       
                       Button()  {
                           counter -= 1
                           updateCookieSprite(int: counter)
                           proxy.burst()
                       }
                       label: {
                           Image(cookieState)
                               .resizable()
                               .interpolation(.none)
                               .scaledToFill()
                               .frame(width: 300, height: 300)
                               //.interpolation(.none)
                               .shadow(radius: 1, x: 5, y: 5)
                       }
                       
                       
                           
                           
                        }
                    
                        //Button("Burst", action: proxy.burst)
                    }
                    
                    //.font(Font.custom("Retro Gaming", size: 30))
                    .padding(10)
                    //.background(RoundedRectangle(cornerRadius: 50).fill(Color.red))
                   // .foregroundColor(.white)
                }
                else {
                    Text("YOU DEFEATED THE CCP!")
                       // .font(Font.custom("Retro Gaming", size: 40))
                        .padding(40)
                    Button("Do It Again") {
                        //resetGame()
                    }
                  //  .font(Font.custom("Retro Gaming", size: 30))
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.green))
                    .foregroundColor(.white)
                }
            }
            else {
                Text("YOU WERE DEFEATED BY THE CCP!")
                  //  .font(Font.custom("Retro Gaming", size: 40))
                    .padding(40)
                Button("Do It Again") {
                    //resetGame()
                }
             //   .font(Font.custom("Retro Gaming", size: 30))
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 50).fill(Color.green))
                .foregroundColor(.white)
            }
            
        }//Vstack Close
        .padding()

    }
    func updateCookieSprite(int counter: Int) {
        if counter < 26 {
            cookieState = "CookieState2"
        }
        if counter < 13 {
            cookieState = "CookieState3"
        }
    }
}

struct CookieClicker_Previews: PreviewProvider {
    static var previews: some View {
        CookieClicker()
    }
}
