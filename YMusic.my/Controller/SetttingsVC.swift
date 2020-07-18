//
//  SetttingsVC.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 18.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class SetttingsVC: UIViewController {

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func shareBtnPressed(_ sender: UIButton) {
        MessageAlert.present(self, title: "Oops..", message: "Function can be added after release")
    }
    
    @IBAction func switchChangedValue(_ sender: UISwitch) {
        setVideoLoadState(sender.isOn)
    }
    
    // MARK: - Video Load State
    private func setVideoLoadState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: C.videoLoadState.rawValue)
    }
    
}
