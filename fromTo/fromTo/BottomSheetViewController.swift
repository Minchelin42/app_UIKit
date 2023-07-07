//
//  BottomSheetViewController.swift
//  fromTo
//
//  Created by 민지은 on 2023/07/07.
//

import UIKit

class BottomSheetViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 31.5
        view.clipsToBounds = true
        
        view.backgroundColor = .white
    }
}
