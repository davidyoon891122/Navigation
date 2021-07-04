//
//  EditViewController.swift
//  Navigation
//
//  Created by David Yoon on 2021/07/04.
//

import UIKit
// 인터페이스 처럼 사용 되는 protocol
protocol EditDelegate {
    // 메인 뷰에서 수정 뷰 데이터 받기위한 함수
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didResizeOnOffDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    @IBOutlet var lblWay: UILabel!
    // ViewController에서 EditViewController의 뷰에는 직접 접근이 안되기 떄문에 변수 선언해서 해당 변수에 접근하여 데이터 삽입
    var textWayValue: String = ""
    var textMessage: String = ""
    // delegate 변수
    var delegate: EditDelegate?
    @IBOutlet var txtMessage: UITextField!
    
    @IBOutlet var lblResize: UIButton!
    @IBOutlet var swlsOn: UISwitch!
    
    var isOn = false
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        // Do any additional setup after loading the view.
        // Main에서 직접 뷰에 접근 못하기 때문에 텍스트 변수에 데이터 전달
        txtMessage.text = textMessage
        // 처음 false로 설정
        swlsOn.isOn = isOn
        if (isZoom) {
            lblResize.setTitle("확대", for: .normal)
        }else {
            lblResize.setTitle("축소", for: .normal)
        }
    }
    
    // 버튼 클릭 시 navigationController를 사용 하여 현재 화면을 pop
    @IBAction func btnDone(_ sender: UIButton) {
        // btnDone 버튼 클릭시 deletgate 있으면 didMessageEdiotDone 함수 호출(자신과 자신의 UITextField에 적혀진 text 전달
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didResizeOnOffDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    
    @IBAction func btnResize(_ sender: UIButton) {
        if (isZoom) {
            isZoom = false
            lblResize.setTitle("축소", for:.normal)
        } else {
            isZoom = true
            lblResize.setTitle("확대", for: .normal)
        }
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
