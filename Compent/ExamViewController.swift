//
//  ExamViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/22.
//

import UIKit
import SnapKit

class ExamViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let EXAM_CELL_ID = "EXAM_CELL_ID"
    var nextIndex: Int = 5
    
    var data: Array<ExamModel>!
    var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EXAM_CELL_ID, for: indexPath) as! ExamCell
        
        cell.setData(data: self.data)
        cell.updateCell(indexPath: indexPath)
        cell.responseCellEvent(i: indexPath.row)
        
        return cell
    }
    
    private func initData(){
        data = Array<ExamModel>()
        data.append(ExamModel(examTitleString: "在Swift中，class是引用传递，struct是值传递", examAnswerIndex: 1, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "viewDidLoad()方法在应用程序的生命周期仅且仅调用一次", examAnswerIndex: 1, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "iOS12及以上默认支持http请求", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "class方法可被子类继承并重写", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "View及其子类设置maskToBounds及其相关属性，绘制帧率不变", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "一般而言，Alamofire可在reponse获取到后直接更新UI", examAnswerIndex: 1, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "一般而言，URLSessionTask可在reponse获取到后直接更新UI", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "MVVM架构中，V与M的通信是双向的", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "Navigation导航的机制是先进先出", examAnswerIndex: 0, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "双赋值号可直接用来判断字符串、数值、对象是否相等", examAnswerIndex: 1, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "MVC架构中，V与M的通信是双向的", examAnswerIndex: 1, examTypeString: "判断"))
        data.append(ExamModel(examTitleString: "在select语句中，*号查询与罗列查询所需字段进行查询其性能消耗是一样的", examAnswerIndex: 0, examTypeString: "判断"))
    }
    
    private func initView(){
        initData()
       
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        flowLayout.minimumLineSpacing = 0.000001
        
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: flowLayout)
        collectionView.register(ExamCell.self, forCellWithReuseIdentifier: EXAM_CELL_ID)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        collectionView.isPagingEnabled = true
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(self.view.snp.top).offset(100)
            make.bottom.equalTo(self.view.snp.bottom)
            make.center.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
        initView()
    }

    // MARK: - Event.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ExamCell
        
        print("------> EXECUTE.")
        
        collectionView.layoutIfNeeded()
        if cell.isAnswerSucced(){
            self.nextIndex = (indexPath.row + 1)
            print("NEXT INDEX:\(nextIndex)")
            self.collectionView.scrollToItem(at: IndexPath(row: 5, section: 5), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            
        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.x > 0 {
            collectionView.bounces = true
        }
        if collectionView.contentOffset.x < 0 {
            collectionView.bounces = false
        }
    }

}
