//
//  MyFriendsApp.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import SwiftUI

@main
struct MyFriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, ContactProvider.shared.newContext)
        }
    }
}
