//
//  OptionCellTableViewCell.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    @IBOutlet weak var optionTextField: UITextField!
    lazy private var presenter = OptionListPresenter()
    lazy private var option = Option()
    
    func configure(_ presenter: OptionListPresenter, _ item: Int) {
        self.presenter = presenter
        option = presenter.options[safe: item] ?? Option()
        optionTextField.text = option.name
        optionTextField.delegate = self
    }
}

// MARK: - Extensions
extension OptionTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == optionTextField {
            //If name is empty, delete the object
            let name = optionTextField.text == "" ? nil : optionTextField.text
            presenter.update(name, for: "name", object: option)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
