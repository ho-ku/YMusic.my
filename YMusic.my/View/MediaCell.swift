//
//  ChannelCell.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 20.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class MediaCell: UICollectionViewCell {
    @IBOutlet weak var backImageView: UIImageView! {
        didSet {
            backImageView.contentMode = .scaleAspectFill
            backImageView.layer.cornerRadius = 20
            backImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var dimmView: UIView! {
        didSet {
            dimmView.layer.cornerRadius = 20
            dimmView.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.minimumScaleFactor = 0.5
        }
    }
    @IBOutlet weak var subscribersLabel: UILabel! {
        didSet {
            subscribersLabel.adjustsFontSizeToFitWidth = true
            subscribersLabel.minimumScaleFactor = 0.5
        }
    }
}
