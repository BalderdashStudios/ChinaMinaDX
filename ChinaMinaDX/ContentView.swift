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
    
    var body: some View {
        if isLoggedIn {
                    Victims()
                } else {
                    Home(isLoggedIn: $isLoggedIn) // Pass it with $
                }
    }
}
#Preview{
    ContentView()
}

