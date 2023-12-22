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
    
    // нужно ли здесь было реализовывать метод разлогина?
}
