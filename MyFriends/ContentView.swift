//
//  ContentView.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach((0...10), id: \.self) { item in
                    ContactRowView()

                }
            }.navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
