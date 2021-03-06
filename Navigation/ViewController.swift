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
    @IBOutlet var imageView: UIImageView!
    // 이미지 객체에 할당
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    // 전구 확대 축소 설정하는 변수
    var isZoom = false
    // EditView에 보내기 전에 전구 확대 축소 설정 변수
    var oriZoom = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 초기에 켜진상태로 설정
        imageView.image = imgOn
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
        //editViewContoller의 isOn 변수에 MainView isOn 값 넘김
        editViewController.isOn = isOn
        // 확대 축소 오리지날 값 editView에 전달
        editViewController.isZoom = oriZoom
        //editViewController.delegate에 자신 선언
        editViewController.delegate = self
    }
    // protocol에서 정의된 함수 정의 
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    //  EditView에서 데이터 받아와 현재 값에 셋팅
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        // 받아온 isOn 값이 참이면 켜짐
        if isOn {
            imageView.image = imgOn
            self.isOn = true
        } else {
            imageView.image = imgOff
            self.isOn = false
        }
    }
    
    func didResizeOnOffDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        if (isZoom) {
            if oriZoom {
                
            } else {
                //self.isZoom = false
                self.oriZoom = true
                newWidth = imageView.frame.width * scale
                newHeight = imageView.frame.height * scale
                imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if oriZoom {
                //self.isZoom = true
                self.oriZoom = false
                newWidth = imageView.frame.width / scale
                newHeight = imageView.frame.height / scale
                imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
            
        }
        
        
    }
}

