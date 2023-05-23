//
//  ContactListEntity.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import Foundation

enum ContactListType {
    case favorite
    case main
    case addFavorite
}

struct ContactInfo {
    var name: String
    var number: String
    var image: String? = ""
    var direcction: String? = ""
    var isfavorite: Bool = false
}
