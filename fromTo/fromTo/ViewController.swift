//
//  ViewController.swift
//  fromTo
//
//  Created by 민지은 on 2023/07/07.
//

import UIKit

class ViewController: UIViewController {

    private var spaceLabel: UILabel = {
        let label = UILabel()
        label.text = "카페"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    private func timeLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }
    
    lazy var timeLabelView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [timeLabel("오픈"),timeLabel("마감")])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
        st.spacing = 137

        return st
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [dayButton("월"), dayButton("화"), dayButton("수"), dayButton("목"), dayButton("금"), dayButton("토"), dayButton("일")])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
        st.spacing = 5.3

        return st
    }()

    private func dayButton(_ title: String) -> UIButton {
        let button = UIButton(type: .custom)

        button.backgroundColor = .black

        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)

        button.translatesAutoresizingMaskIntoConstraints = false

        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40.56).isActive = true

        button.layer.cornerRadius = 17
        button.clipsToBounds = true

        return button
    }
    
    lazy var timeStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [timeButton("07:00"),timeButton("23:00")])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
        st.spacing = 17

        return st
    }()

    private func timeButton(_ title: String) -> UIButton {
        let button = UIButton(type: .custom)

        button.backgroundColor = .black

        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        button.heightAnchor.constraint(equalToConstant: 51).isActive = true
        button.widthAnchor.constraint(equalToConstant: 148).isActive = true

        button.layer.cornerRadius = 25.5
        button.clipsToBounds = true

        return button
    }
    
    private var findButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(displayP3Red: 253/255, green: 98/255, blue: 98/255, alpha: 1)
        button.setTitle("점포 찾기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        button.translatesAutoresizingMaskIntoConstraints = false

        button.heightAnchor.constraint(equalToConstant: 63).isActive = true
        button.widthAnchor.constraint(equalToConstant: 322).isActive = true

        button.layer.cornerRadius = 31.5
        button.clipsToBounds = true

        return button
    }()
    
    private var nowOpenButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(displayP3Red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        button.setTitle("현재 영업중인 점포 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        button.translatesAutoresizingMaskIntoConstraints = false

        button.heightAnchor.constraint(equalToConstant: 63).isActive = true
        button.widthAnchor.constraint(equalToConstant: 322).isActive = true

        button.layer.cornerRadius = 31.5
        button.clipsToBounds = true

        return button
    }()
    
    lazy var bottomSheetView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 31.5
        view.clipsToBounds = true
        
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 399),
            view.widthAnchor.constraint(equalToConstant: 394)
        ])
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(bottomSheetView)
        view.addSubview(spaceLabel)
        view.addSubview(buttonStackView)
        view.addSubview(timeStackView)
        view.addSubview(timeLabelView)
        view.addSubview(findButton)
        view.addSubview(nowOpenButton)
        
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        spaceLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        timeStackView.translatesAutoresizingMaskIntoConstraints = false
        timeLabelView.translatesAutoresizingMaskIntoConstraints = false
        findButton.translatesAutoresizingMaskIntoConstraints = false
        nowOpenButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomSheetView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 472),
            
            spaceLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 496),
            spaceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36),
            
            buttonStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 529),
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36),
            
            timeStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 598),
            timeStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35),
            
            timeLabelView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 573),
            timeLabelView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36),
            
            findButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 666),
            findButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35),
            
            nowOpenButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 745),
            nowOpenButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35)
 
        ])
    }
    
}