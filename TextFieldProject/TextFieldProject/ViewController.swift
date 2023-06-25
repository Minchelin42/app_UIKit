//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 민지은 on 2023/05/29.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup(){
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always //입력을 했을 때 전체를 지울 수 있는 버튼 자동 생성
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder() //화면에 들어가자마자 키보드가 올라오게 만듦
    }
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textField.resignFirstResponder() : 동일한 동작을 수행함
    }

    // 텍스트 필드의 입력을 시작할 때 호출이 되는 메서드 [시작할지 말지의 여부를 허락하는 것]
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) //해당 함수의 이름을 출력하는 기능 : #function
        return true
    }
    
    // 반환을 하지 않는 함수는 보통 어떠한 시점을 의미 (텍스트필드의 입력이 시작된 시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드에 입력을 시작했습니다")
    }
    
    // Clear하는 것을 허락할 것인지 말것인지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드의 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출됨 (허락 여부)
    // 한글자 한글자 입력이 될 때마다 호출 -> true일 때 입력 허용, false일 때 입력 거부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //print(string)
        //return true
        
        //텍스트 입력을 최대 10글자로 제한하는 논리
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    // 텍스트필드의 enter키가 눌러지면 다음 동작을 허락할 것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else{
            return true
        }
    }
    
    // 텍스트필드의 실제 입력이 끝나는 것을 허락할 것인지 말것인지
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 실제로 텍스트필드의 입력이 실제로 끝나는 그순간에 호출됨
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("유저가 텍스트필드에 입력을 끝냈습니다")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder() //키보드가 내려가게 만듦
    }

}

