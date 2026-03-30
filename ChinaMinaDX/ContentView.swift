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
    @StateObject private var notificationManager = NotificationManager()
    
    @State private var isLoggedIn = false
    @State private var screen2 = false
    @State private var screen3 = false
    @State private var screen4 = false
    @State private var userWinState = 0
    @State private var userData: UserData = UserData(userName: "",passWord: "")
    
    var body: some View {
        ZStack {
            if !isLoggedIn {
                Home(isLoggedIn: $isLoggedIn, userData: $userData)
            }
            else if isLoggedIn && !screen2{
                Victims(screen2: $screen2, userData: $userData)
            }
            else if screen2  && !screen3{
                //ChatRoom()
                ZStack {
                    CookieClicker(screen3: $screen3, userWinState: $userWinState)
                    MatrixRainView()
                }
                .onAppear {
                    notificationManager.show(message: "LETS SEE IF YOU CAN GET PAST THIS!!")
                }
            }
            else if screen3 && !screen4{
                ZStack {
                    ContentViewCookie(screen4: $screen4, userWinState: $userWinState)
                    MatrixRainView()
                }
                .onAppear {
                    notificationManager.show(message: "NO WHAT ARE YOU DOING??")
                }
            }
            else if screen4 {
                ZStack {
                    EndScreen(userWinState: userWinState, userData: $userData)
                }
            }
            
            NotificationBanner(message: notificationManager.message, isVisible: $notificationManager.isVisible)
                .padding(.top, 24)
        }
    }
}
#Preview{
    ContentView()
}

