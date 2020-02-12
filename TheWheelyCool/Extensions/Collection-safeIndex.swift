//
//  Collection-safeIndex.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import Foundation

//To avoid Index out of range error
public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
