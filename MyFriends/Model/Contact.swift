//
//  Contact.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import Foundation
import CoreData

final class Contact: NSManagedObject {
    
    @NSManaged var dob: Date
    @NSManaged var namme: String
    @NSManaged var notes: String
    @NSManaged var phoneNUmber: String
    @NSManaged var emaiil: String
    @NSManaged var isFavourite: Bool
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "isFavourite")
    }
    
}
