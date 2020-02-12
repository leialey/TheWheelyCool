//
//  OptionList.swift
//  TheWheelyCool
//
//  Created by Leialey on 12.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import RealmSwift

class OptionList: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    let options = List<Option>()
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
