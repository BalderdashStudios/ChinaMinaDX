//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
import Combine
struct ContentView: View
{
    @State private var isLoggedIn = false
    @State private var screen2 = false
    //Ider is a chud
    var body: some View {
        if !isLoggedIn {
            Home(isLoggedIn: $isLoggedIn)
        }
        else if isLoggedIn && !screen2{
            Victims(screen2: $screen2)
        }
        else if screen2 {
            //ChatRoom()
        }
    }
}
#Preview{
    ContentView()
}

