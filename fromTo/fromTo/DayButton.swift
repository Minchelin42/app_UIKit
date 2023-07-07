//
//  DayButton.swift
//  fromTo
//
//  Created by 민지은 on 2023/07/08.
//

import UIKit

private var dayButtonView: UIView = {
    let view = UIView()
    view.frame.size.height = 35
    view.frame.size.width = 313.5
    view.backgroundColor = UIColor.darkGray
    view.addSubview(dayButton)

    return view
}()


private let dayButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("월", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
    return button
}()

