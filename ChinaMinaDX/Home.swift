//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI
import Combine
struct Home: View {
    @State private var username: String = ""
    @State private var password: String = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var timeElapsed: Int = 0
    @Binding var isLoggedIn: Bool
    var body: some View {
        VStack {
            ZStack{
                Image("ccp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10, opaque: true)
                Image("buffalo-outdoor-farm-with-field-nature-background-photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10, opaque: true)
                    .opacity(timeElapsed == Int.random(in: 0..<10) ? 0.0 : 1.0)
               
                    
                Text(timeElapsed == Int.random(in: 0..<15) ? "我们正在窃取您的数据。" : "Good afternoon, \nIder")
                    .onReceive(timer) { _ in
                        timeElapsed += 1
                        if timeElapsed==25{
                            timeElapsed = 0
                        }
                    }
                    .font(.largeTitle)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .foregroundColor(.black)
                    .padding()
                
                
                VStack() {
                    VStack() {
                        TextField(
                            "Username",
                            text: $username
                        )
                        Divider().background(Color.gray)
                        SecureField(
                            "Password",
                            text: $password
                        )
                        Divider().background(Color.gray)
                        
                        
                        Button("Sign on") {
                            isLoggedIn = true
                        }
                        .padding(14)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        
                        
                        
                        HStack() {
                            Button("Forgot username?") {
                                
                            }
                            .foregroundColor(.blue)
                            Button("Forgot password?") {
                                
                            }
                            .foregroundColor(.blue)
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 150)
                    .background(.white)
                    .cornerRadius(10)
                    
                    
                    
                    
                    HStack() {
                        VStack() {
                            Text("Explore our \nproducts")
                                .foregroundColor(.black)
                                .bold()
                            
                            Text("Find your fit")
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .background(.white)
                        .cornerRadius(10)
                        
                        
                        VStack() {
                            Text("Simple savings \naccount solutions")
                                .foregroundColor(.black)
                                .bold()
                            
                            Text("See details")
                                .foregroundColor(.black)
                                .padding(10)
                            
                        }
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .background(.white)
                        .cornerRadius(10)
                        
                        
                    }
                    
                    
                }
                .padding()
                
                
            }
            
        }
    }
}
#Preview {
    Home(isLoggedIn: .constant(false))
}
