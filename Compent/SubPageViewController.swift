//
//  SubPageViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/12.
//

import UIKit

class SubPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var vcArray: Array<UIViewController> = [PageOneViewController(),
                                            PageTwoViewController()]
    var pageTitle: Array<String> = ["One", "Two"]
    var pageControl: UIPageControl!
    
    private func initView(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        
        let defaultVC = vcArray[0]
        self.setViewControllers([defaultVC], direction: .forward, animated: true, completion: nil)
        
        self.transitionStyle
        
    }
    
    // MARK: - Delegate.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex: Int = vcArray.firstIndex(of: viewController) else {
            return nil
        }
         
        let nextIndex = currentIndex + 1
        let orderedViewControllersCount = vcArray.count
         
        guard orderedViewControllersCount != nextIndex else {
            return vcArray.first
        }
         
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
         
        return vcArray[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex: Int = vcArray.firstIndex(of: viewController) else{
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else {
            return vcArray.last
        }
        guard vcArray.count > previousIndex else {
            return nil
        }
        return vcArray[previousIndex]
    }
}
