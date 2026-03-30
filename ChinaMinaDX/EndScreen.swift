//
//  EndScreen.swift
//  ChinaMinaDX
//
//  Created by Mobile on 3/27/26.
//


import SwiftUI

struct EndScreen: View {

    var userWinState: Int
    @Binding var userData : UserData
    
    let messageBoth: String = "This is ex-cia agent John Kiriakou, your phone has been seized by the FBI. Luckily you were able to fend of all of the CCP’s attacks before we shut their operation down. Remember next time you might not be that lucky, we might have to get the hummus out.\n -John"
    
    let messageOne: String = "This is ex-cia agent John Kiriakou, your phone has been seized by the FBI. Luckily you were able to fend of one of the CCP’s attacks before we shut their operation down. Unfortunantly some of your information was uploaded, expect to get a few more spam calls, next time we might have to get the hummus out.\n -John"
    
    let messageNone: String = "This is ex-CIA agent John Kiriakou, your phone has been seized by the FBI. Unfortunantly you weren't able to fend of the CCP’s attacks before we shut their operation down. Expect a call from me in the next few days, untill then lay low. We're going to bring the hummus out. \n -John"
    
    var message: String {
        if userWinState == 0 {
            return messageNone
        }
        else if userWinState == 1 {
            return messageOne
        }
        else if userWinState == 2 {
           return messageBoth
        }
        return ""
    }
    
    
    
    var body: some View {
        
        
        ZStack() {
            Image("FBIHacked")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                //.blur(radius: 10, opaque: true)
            //TextEffect(text: message)
            TextEffect(text: "Hello, " + userData.userName + ". \n" + message)
                .background(Color.black)
                .foregroundColor(.white)
                .padding(20)
                .bold()
        }
    }
}



struct EndScreen_Previews: PreviewProvider {
    static var previews: some View {
        EndScreen(userWinState: 0, userData: .constant(UserData(userName: "Ider", passWord: "")))
    }
}

