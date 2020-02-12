//
//  OptionsEntryViewController.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

class OptionsEntryViewController: UIViewController, OptionListPresenterDelegate {
    @IBOutlet weak var optionsTableView: UITableView!
    private let presenter = OptionListPresenter()
    private let optionCellID = "OptionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTableView.register(UINib(nibName: "OptionTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: optionCellID)
        presenter.delegate = self
        hideKeyboardWhenTappedAround()
        addKeyboardObserver()
    }
    
    func updateView(updateType: UpdateType, index: Int) {
        //To update only changed rows
        optionsTableView.beginUpdates()
        let indexPaths = [IndexPath(row: index, section: 0)]
        switch updateType {
        case .delete:
            optionsTableView.deleteRows(at: indexPaths,
                                        with: .fade)
        case .insert:
            optionsTableView.insertRows(at: indexPaths,
                                        with: .top)
        case .modify:
            //shouldn't update anything here
            return
        }
        optionsTableView.endUpdates()
    }
    
    func showStatus(_ status: TaskStatus) {
        //To Show Error - I am skipping it for now to keep it simple
        //(it's very unlikely to happen), though we could use SVProgressHUD, custom alert etc
    }
    
    @objc override func handleKeyboard(notification: NSNotification) {
        let keyboardHeight = getKeyboardHeight(notification)
        optionsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
}

// MARK: - Extensions
extension OptionsEntryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: optionCellID, for: indexPath)
            as? OptionTableViewCell else { fatalError("Cannot cast to OptionTableViewCell") }
        cell.configure(presenter, indexPath.row)
        return cell
    }
}
