//
//  Memo.swift
//  tanshi-Original
//
//  Created by Raytt on 2022/02/15.
//

import Foundation
import RealmSwift

class Group: Object {
    @objc dynamic var group: String = ""
    @objc dynamic var zimsyo: String = ""
    @objc dynamic var part: String = ""
    let members = List<Member>()
}

class Member: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var part: String = ""
}
