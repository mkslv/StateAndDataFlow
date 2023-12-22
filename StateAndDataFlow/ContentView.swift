//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @ObservedObject var userManager: userDefaults
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(title: timer.buttonTitle,completion: timer.startTimer, color: .red)
            Spacer()
            ButtonView(title: userManager.buttonTitle,completion: userManager.deleteUser, color: .blue)
            Spacer()
        }
        .environmentObject(userManager)
    }
}

#Preview {
    ContentView(userManager: userDefaults())
}

struct ButtonView: View {
    let title: String
    let completion: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: completion) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}


