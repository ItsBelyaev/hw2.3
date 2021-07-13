//
//  InformationViewController.swift
//  hw2.3
//
//  Created by Daniil Belyaev on 13.07.2021.
//

import UIKit

class InformationViewController: UIViewController {

    var username = ""
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = username

    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
