//
//  WheelViewController.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

class WheelViewController: UIViewController {
    @IBOutlet weak var wheelView: WheelyCoolView!
    private let presenter = OptionListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        wheelView.texts = presenter.options.map({$0.name})
    }
    
    @IBAction func spinTheWheel(_ sender: UIButton) {
        wheelView.spin()
    }
}
