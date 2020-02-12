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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func spinTheWheel(_ sender: UIButton) {
        wheelView.spin()
    }
}
