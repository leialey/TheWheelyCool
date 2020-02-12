//
//  UIViewController-extension.swift
//  TheWheelyCool
//
//  Created by Leialey on 11.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

extension UIViewController {
//To dismiss keyboard when tapping around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

//To adjust content offset when showing / hiding keyboard
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboard),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboard),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func getKeyboardHeight(_ notification: NSNotification) -> CGFloat {
        if notification.name == UIResponder.keyboardWillShowNotification,
            let userInfo = notification.userInfo,
            let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            return keyboardSize.cgRectValue.height
        } else {
            return 0
        }
    }
    
    @objc func handleKeyboard(notification: NSNotification) {
        //to override in the child view controllers
    }
}
