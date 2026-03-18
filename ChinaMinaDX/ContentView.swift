//
//  ContentView.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/17/26.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            ZStack{
                Image("buffalo-outdoor-farm-with-field-nature-background-photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10, opaque: true)
                
                Text("Good afternoon, \nIder")
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
                                TextField(
                                            "Password",
                                            text: $password
                                        )
                                Divider().background(Color.gray)

                                
                                Button("Sign on") {
                                    
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
    ContentView()
}
