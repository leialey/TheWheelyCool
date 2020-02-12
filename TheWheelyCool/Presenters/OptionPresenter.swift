//
//  OptionListViewModel.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import Foundation
import RealmSwift

class OptionListPresenter {
    private let realm = try! Realm()
    private var currentList: OptionList
    private(set) var options: List<Option>
    weak var delegate: OptionListPresenterDelegate?
    var numberOfRows: Int {
        //To display empty option in the last row
        return options.count + 1
    }
    
    // MARK: - Public methods
    
    init() {
        //Only one (default) list for now. In the future there can be many lists
        let currentListName = "default"
        currentList = realm.objects(OptionList.self).filter("name == %@", currentListName).first ?? OptionList(name: currentListName)
        options = currentList.options
        if currentList.realm == nil {
            addData(currentList)
        }
    }
    
    func update(_ value: Any?, for key: String, object: Option) {
        do {
            //New object to add
            if object.realm == nil {
                value != nil ? try insertData(value, for: key, object: object) : nil
                //Existing object to update
            } else {
                value != nil ? try updateData(value, for: key, object: object) : try deleteData(object)
            }
        } catch {
            delegate?.showStatus(TaskStatus.errorRealm)
        }
    }
    
    // MARK: - Private methods
    
    private func addData(_ object: Object) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            delegate?.showStatus(TaskStatus.errorRealm)
        }
    }
    
    private func updateData(_ value: Any?, for key: String, object: Option) throws {
        try realm.write {
            object.setValue(value, forKey: key)
        }
    }
    
    private func insertData(_ value: Any?, for key: String, object: Option) throws {
        object.setValue(value, forKey: key)
        try realm.write {
            currentList.options.insert(object, at: options.count)
        }
        delegate?.updateView(updateType: .insert, index: options.count)
    }
    
    private func deleteData(_ option: Option) throws {
        guard let index = options.index(of: option) else { return }
        try realm.write {
            realm.delete(option)
        }
        delegate?.updateView(updateType: .delete, index: index)
    }
}
