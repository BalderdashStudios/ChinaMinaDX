//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
internal import Combine
struct ContentView: View
{
    @State private var isLoggedIn = false
    @State private var screen2 = false
    @State private var screen3 = false
    @State private var screen4 = false
    @State private var userWinState = 0
    //Ider is a chud
    var body: some View {
        if !isLoggedIn {
            Home(isLoggedIn: $isLoggedIn)
        }
        else if isLoggedIn && !screen2{
            Victims(screen2: $screen2)
        }
        else if screen2  && !screen3{
            //ChatRoom()
            ZStack {
                CookieClicker(screen3: $screen3, userWinState: $userWinState)
                MatrixRainView()
            }
        }
        else if screen3 && !screen4{
            ZStack {
                ContentViewCookie(screen4: $screen4)
                MatrixRainView()
            }
        }
        else if screen4 {
            ZStack {
                EndScreen(userWinState: userWinState)
            }
        }
    }
}
#Preview{
    ContentView()
}

