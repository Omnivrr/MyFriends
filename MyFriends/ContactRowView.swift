//
//  ContactRowView.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import SwiftUI

struct ContactRowView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("\(contact.isBirthday ? "🎈" : "")\(contact.name)")
                .font(.system(size: 26, design:  .rounded).bold())
            
            Text(contact.email)
                .font(.callout.bold())
            
            Text(contact.phoneNumber)
                .font(.callout.bold())
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topTrailing ){
            Button {
                toggleFave()
            } label: {
                Image(systemName: "star")
                    .font(.title3)
                    .symbolVariant(.fill)
                    .foregroundColor(contact.isFavourite ? .yellow : .gray.opacity(0.3))
            }
            .buttonStyle(.plain)
        }
    }
}

private extension ContactRowView {
    func toggleFave() {
        contact.isFavourite.toggle()
        do {
            if moc.hasChanges {
                try moc.save()
            }
        } catch {
            print(error)
        }
    }
}
/*struct ContactRowView_Previews: PreviewProvider {
 static var previews: some View {
 ContactRowView()
 }
 }
 */
