//
//  PageScrollViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/12.
//

import UIKit

class PageScrollViewController: UIViewController {
    
    var containerView: UIView!
    var pageControl: UIPageControl!
    var subPageVC: SubPageViewController!
    
    private func initView(){
        containerView = UIView(frame: self.view.frame)
        containerView.backgroundColor = .cyan
        self.view.addSubview(containerView)
        
        subPageVC = SubPageViewController()
  //      self.addChild(subPageVC)
        
        pageControl = UIPageControl(frame: CGRect(x: ((self.view.frame.width / 2) - 15), y: (self.view.frame.height - 38), width: 30, height: 25))
        pageControl.numberOfPages = 2
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        initView()
    }
    
}
