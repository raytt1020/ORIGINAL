//
//  Model.swift
//  tanshi-Original
//
//  Created by 村上航輔 on 2022/02/28.
//

import Foundation
import RealmSwift

class Group: Object {
    @objc dynamic var group: String = ""
    @objc dynamic var zimusyo: String = ""
    @objc dynamic var imageURL: String = ""
    var members = List<Member>()
}

class Member: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var part: String = ""
    @objc dynamic var imageURL: String = ""
}
