//
//  VideoView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit

class VideoView: UIView {
    
    let CELL_ID = "CELL_ID"
    var videoCollectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installVideoCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installVideoCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: self.frame.width, height: 150)
        
        videoCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        videoCollectionView.backgroundColor = UIColor.init(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        videoCollectionView.register(ListCell.self, forCellWithReuseIdentifier: CELL_ID)
        self.addSubview(videoCollectionView)
    }

}
