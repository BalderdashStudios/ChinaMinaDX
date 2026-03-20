//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
import Combine
struct ContentView: View {
    var body: some View {
        NavigationView {
            if Home.signOn {
                Victims()
            }
            else {
                Home()
            }
        }
    }
}
#Preview{
    ContentView()
}

