//
//  Mentor.swift
//  tanshi-Original
//
//  Created by Raytt on 2021/12/07.
//

import UIKit
class Idol{
    var name: String!
    var group: String!
    var imageName: String!
    var zimusyo: String!
    var part: String!
    init(name: String, imageName: String, group: String, zimusyo: String, part: String) {
        self.name = name
        self.imageName = imageName
        self.group = group
        self.zimusyo = zimusyo
        self.part = part
    }
    func getImage() ->UIImage{
        return UIImage(named: imageName)!
    }
    func getImageWithURL() ->UIImage{
        return UIImage(contentsOfFile: imageName) ?? UIImage()
    }
}
