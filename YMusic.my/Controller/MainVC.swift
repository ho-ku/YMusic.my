//
//  MainVC.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 18.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Local ID Storage
    private let channelIDs = ["UCTLXD_eAdt1TUKpO_pyLXSw", "UCs6eXM7s8Vl5WcECcRHc2qQ", "UCGzARfmd-3zXaSFEpE1X_GQ", "UCjGaRhuY1UzblY5EL-TfZ1w"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomView: UIView! {
        didSet {
            bottomView.layer.cornerRadius = 10.0
            bottomView.clipsToBounds = true
            bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    // MARK: - Instances
    private let requestManager = RequestManager()
    private let cache = NSCache<AnyObject, AnyObject>()
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Cache Functions
    private func loadToCache(_ key: String, value: AnyObject) {
        cache.setObject(value, forKey: key as AnyObject)
    }
    
    private func loadFromCache(_ key: String) -> AnyObject? {
        return cache.object(forKey: key as AnyObject)
    }

}

// MARK: - UICollectionViewDelegate
extension MainVC: UICollectionViewDelegate {
    
    
    
}

// MARK: - UICollectionViewDataSource
extension MainVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.section {
//        case 0:
            if let cachedCell = loadFromCache("channelCell\(indexPath.row)") as? MediaCell {
                return cachedCell
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.channelCellID.rawValue, for: indexPath) as! MediaCell
            requestManager.fetchChannel(id: channelIDs[indexPath.row]) { [unowned self] (data, response, error) in
                guard error == nil, let data = data, let parsedData = try? JSONDecoder().decode(Channel.self, from: data) else { return }
                let snippet = parsedData.items[0].snippet
                DispatchQueue.main.async {
                    cell.nameLabel.text = snippet.title
                    cell.subscribersLabel.text = "\(parsedData.items[0].statistics.subscriberCount) subscribers"
                }
                let imageUrl = snippet.thumbnails.high.url
                self.requestManager.fetchImage(urlString: imageUrl) { [unowned self] (data, response, error) in
                    guard error == nil, let data = data else { return }
                    DispatchQueue.main.async {
                         cell.backImageView.image = UIImage(data: data)
                        self.loadToCache("channelCell\(indexPath.row)", value: cell)
                    }
                }
            }
            return cell
//        case 1:
//        default:
//            return UICollectionViewCell()
//        }
        
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: 343, height: 180)
        default:
            return CGSize(width: 343, height: 180)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
