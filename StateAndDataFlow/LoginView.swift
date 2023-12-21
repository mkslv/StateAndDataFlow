//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var userManager: UserManager
//    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField("Enter your name", text: $userManager.name)
                    .multilineTextAlignment(.center)
                Text(userManager.name.count.formatted())
                    .foregroundStyle(userManager.name.count < 3 ? .red : .green)
            }
            .padding()
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(userManager.name.count < 3 ? true : false)
        }
    }
    
    private func login() {
        if !userManager.name.isEmpty {
            userManager.name = userManager.name
            userManager.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView(userManager: UserManager())
}
