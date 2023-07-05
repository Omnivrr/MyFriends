//
//  CreateContactView.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.

import SwiftUI

struct CreateContactView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            Section("General") {
                TextField("Name", text: .constant(""))
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: .constant(""))
                    .keyboardType(.phonePad)
                
                DatePicker("Birthday", selection: .constant(.now),
                           displayedComponents: [.date])
                .datePickerStyle(.compact)
                
                Toggle("Favourite", isOn: .constant(true))
            }
            
            Section("Notes") {
                
                
                TextField("", text: .constant("This is a note, it's all blaa blaa blaa"),
                          axis: .vertical)
            }
        }
        .navigationTitle("Name Here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel"){
                    dismiss()
                }
            }
        }
    }
}

struct CreateContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateContactView()
        }
    }
}
