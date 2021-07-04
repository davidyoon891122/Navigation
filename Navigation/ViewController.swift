//
//  ViewController.swift
//  Navigation
//
//  Created by David Yoon on 2021/07/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
        } else if (segue.identifier == "editBarButton") {
            editViewController.textWayValue = "segue: use Bar button"
        }
    }
}

