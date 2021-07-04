//
//  ViewController.swift
//  Navigation
//
//  Created by David Yoon on 2021/07/04.
//

import UIKit
// EditViewController에서 만든 EditDelegate protocol 상속
class ViewController: UIViewController, EditDelegate {
    @IBOutlet var txtMessage: UITextField!
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
        // 메인에서 수정으로 화면 넘길때 editViewContoller.textMessage에 자신의 UITextField 텍스트값 전달
        editViewController.textMessage = txtMessage.text!
        //editViewController.delegate에 자신 선언
        editViewController.delegate = self
    }
    // protocol에서 정의된 함수 정의 
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
}

