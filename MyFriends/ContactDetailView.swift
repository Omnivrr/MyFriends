//
//  ContactDetailView.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import SwiftUI

struct ContactDetailView: View {
    var body: some View {
        List {
            Section("General") {
                LabeledContent {
                    Text("Email Here")
                } label: {
                    Text("Email")
                }
                LabeledContent {
                    Text("Phone Number Here")
                } label: {
                    Text("Phone Number")
                }
                LabeledContent {
                    Text(.now, style: .date)
                } label: {
                    Text("Birthday")
                    
                }
            }
            Section("Notes") {
                Text ("This is a long unnecessary note bla blaaaaa blaaaaaa blaaaa blaaa blaa blaa")
            }
        }
        .navigationTitle("Name Here")
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView()
    }
}
