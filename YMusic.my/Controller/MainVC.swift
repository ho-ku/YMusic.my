//
//  MainVC.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 18.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var bottomView: UIView! {
        didSet {
            bottomView.layer.cornerRadius = 10.0
            bottomView.clipsToBounds = true
            bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
