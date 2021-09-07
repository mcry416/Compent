//
//  SlideViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/9.
//

import UIKit

class SlideViewController: UIViewController, UITableViewDelegate, UIScrollViewDelegate {
    
    var slideView: SlideView!
    
    var slideDataSource: SlideDataSource!
    
    private func initView(){
        let data: Array<String> = ["Blank Space", "Lover", "Style", "Welecome to New York", "Love Story", "ME!", "Shade It Off", "You Need Calm Down", "Safe & Sound", "Delicate", "...Reday For It?", "The Archer", "We Are  Never Ever Getting Backing..", "willow"]
        
        slideDataSource = SlideDataSource(dataArray: data)
        
        slideView = SlideView(frame: self.view.frame)
        
        slideView.rootView.delegate = self
        
        slideView.slideTableView.dataSource = slideDataSource
        slideView.slideTableView.delegate = self
        
        self.view.addSubview(slideView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    // MARK: - Delegate block.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        print("------> OFFSET: \(offsetY)")
        
        if offsetY < 0 {
            NSLog("REMAKE.")
            print("------> EXECUTE <0")
            self.slideView.headerImageView.snp.remakeConstraints{ make in
                make.top.equalTo(self.slideView.snp.top)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.slideView.rootView.frame.size.width - offsetY + 4)
                make.height.equalTo(self.slideView.rootView.frame.size.width - offsetY + 4)
            }
        } else if offsetY > 0 {
            print("------> EXECUTE >0")
            self.slideView.headerImageView.snp.remakeConstraints{ make in
                make.top.equalTo(self.slideView.rootView.snp.top)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.slideView.rootView.frame.size.width)
                make.height.equalTo(self.slideView.rootView.frame.size.width)
            }
        }
        
    }

}
