//
//  ContentView.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingNewContact = false
    @FetchRequest(fetchRequest: Contact.all()) private var contacts
    
    var provider = ContactProvider.shared
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination:  ContactDetailView()) {
                            EmptyView()
                        }
                        .opacity(0)
                        ContactRowView()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingNewContact.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle.badge.plus")
                       
                    }
                }
            }
            .sheet(isPresented: $isShowingNewContact) {
                NavigationStack {
                    CreateContactView(vm: .init(provider: provider))
                }
            }

            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
