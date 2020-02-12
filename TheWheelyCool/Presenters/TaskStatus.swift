//
//  TaskStatus.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

public enum TaskStatus: Error {
    case errorRealm
    
    var errorDescription: String {
        switch self {
        case .errorRealm: return "Error when updating data"
        }
    }
}
