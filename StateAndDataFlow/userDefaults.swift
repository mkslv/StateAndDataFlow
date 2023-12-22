//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

final class userDefaults: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("name") var name = ""
    var buttonTitle = "LogOut"
    
    func deleteUser() {
        isLoggedIn = false
        name = ""
    }
}
