//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 민지은 on 2023/05/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer? // 클래스의 인스턴스는 힙에 저장이 되므로 weak으로 선언 가능
    
    var number: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value 값을 가지고 mainLabel의 텍스트를 세팅해야함
        number = Int(sender.value * 60)
        // let number = Int(slider.value * 60)도 가능함
        
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무엇인가를 실행해야함
        timer?.invalidate() // 기존에 실행되던 타이머를 비활성화 시키는 것
        
        // 다른 함수를 호출하는 방식
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        
        //클로저를 이용한 방식
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ [self] _ in
         // self 라고 선언했지만 timer를 weak으로 선언했기 때문에 강한 참조 사이클이 발생하지 않음
         
            // 반복을 하고 싶은 코드
            
            if number > 0 {
                number -= 1
                // 슬라이더도 줄여야 함
                // label의 표시도 다시 정의해줘야 함
                // 숫자를 계산해서 value 값에 넣어줘야 함
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
            
        }
        
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            // 슬라이더도 줄여야 함
            // label의 표시도 다시 정의해줘야 함
            // 숫자를 계산해서 value 값에 넣어줘야 함
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            // 소리를 나게 해야함
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer = nil
        //timer?.invalidate()
    }
    
    
    
}

