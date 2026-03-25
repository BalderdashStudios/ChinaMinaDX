//
//  Untitled.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/25/26.
//

import SwiftUI

struct ContentViewMatrix: View {
    var body: some View {
        
        ZStack{
            Color.black
            
            MatrixRainView()
        }
        .ignoresSafeArea()

    }
}

struct ContentViewMatrix_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewMatrix()
    }
}
