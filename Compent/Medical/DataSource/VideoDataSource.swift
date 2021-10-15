//
//  VideoDataSource.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit

class VideoDataSource: NSObject, UICollectionViewDataSource {
    
    var dataArray: Array<String>!
    init(dataArray: Array<String>) {
        self.dataArray = dataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL_ID", for: indexPath) as! ListCell
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = dataArray[indexPath.row]
        
        return cell
    }
    
}
