//
//  FlowViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/14.
//

import UIKit

class FlowViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: Array<String> = ["Apple Inc", "B", "Cook","Dave", "Evil", "Facebook AG.Inc", "Times", "Obama", "Tiify", "Luives", "JavaScript", "Spring", "MicroSoft", "Google", "中国", "小日本"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TEST_FLOW", for: indexPath)
        
        let label = cell.viewWithTag(3000) as? UILabel
        label?.text = data[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if data[indexPath.row].count == 1 {
            return CGSize(width: 15, height: 30)
        } else if data[indexPath.row].count == 2 {
            return CGSize(width: 25, height: 30)
        } else if data[indexPath.row].count == 3 {
            return CGSize(width: 35, height: 30)
        } else if data[indexPath.row].count == 4 {
            return CGSize(width: 45, height: 30)
        } else if data[indexPath.row].count == 5 {
            return CGSize(width: 55, height: 30)
        } else if data[indexPath.row].count == 6 {
            return CGSize(width: 65, height: 30)
        } else if data[indexPath.row].count == 7 {
            return CGSize(width: 75, height: 30)
        } else if data[indexPath.row].count == 8 {
            return CGSize(width: 85, height: 30)
        } else if data[indexPath.row].count == 9 {
            return CGSize(width: 95, height: 30)
        } else {
            return CGSize(width: self.view.frame.width, height: 30)
        }
    }
    
    private func initView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 50)
        flowLayout.minimumLineSpacing = 5
        flowLayout.scrollDirection = .vertical
        
        var collectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(FlowCell.self, forCellWithReuseIdentifier: "TEST_FLOW")
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

}
