//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            LogoutButtonView()
            Spacer()
        }
        .environmentObject(userManager)
    }
}

#Preview {
    ContentView(userManager: UserManager())
}

struct ButtonView: View {
        
    @ObservedObject var timer: TimeCounter
    
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}



struct LogoutButtonView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Button(action: {
            userManager.name = ""
            userManager.isLoggedIn = false
        }){
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
