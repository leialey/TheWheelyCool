//
//  ViewProtocols.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

protocol OptionListPresenterDelegate: class {
    func updateView(updateType: UpdateType, index: Int)
    func showStatus(_ status: TaskStatus)
}

protocol OptionListCellDelegate: class {
    func configure(_ presenter: OptionListPresenter, _ item: Int)
}


