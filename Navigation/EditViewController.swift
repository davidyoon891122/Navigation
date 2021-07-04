//
//  EditViewController.swift
//  Navigation
//
//  Created by David Yoon on 2021/07/04.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var lblWay: UILabel!
    // ViewController에서 EditViewController의 뷰에는 직접 접근이 안되기 떄문에 변수 선언해서 해당 변수에 접근하여 데이터 삽입
    var textWayValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        // Do any additional setup after loading the view.
    }
    
    // 버튼 클릭 시 navigationController를 사용 하여 현재 화면을 pop
    @IBAction func btnDone(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
