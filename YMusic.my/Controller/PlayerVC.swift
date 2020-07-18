//
//  PlayerVC.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 18.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var closeButton: UIButton!  {
        didSet {
            closeButton.setImage(closeButton.imageView?.image?.rotate(radians: .pi), for: .normal)
        }
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func closeBtnPressed(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
