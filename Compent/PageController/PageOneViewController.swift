//
//  PageOneViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/29.
//

import UIKit

class PageOneViewController: UIViewController {
    
    var pageControl: UIPageControl!
    
    private func initView(){
        pageControl = UIPageControl(frame: CGRect(x: 200, y: 200, width: 30, height: 25))
        pageControl.numberOfPages = 2
        pageControl.backgroundColor = .brown
        self.view.bringSubviewToFront(pageControl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        
        // Do any additional setup after loading the view.
        let numberType: Int = Int(arc4random_uniform(10))
        switch numberType {
        case 0:
            self.view.backgroundColor = .black
        case 1:
            self.view.backgroundColor = .blue
        case 2:
            self.view.backgroundColor = .brown
        case 3:
            self.view.backgroundColor = .cyan
        case 4:
            self.view.backgroundColor = .darkGray
        case 5:
            self.view.backgroundColor = .gray
        case 6:
            self.view.backgroundColor = .green
        case 7:
            self.view.backgroundColor = .orange
        case 8:
            self.view.backgroundColor = .purple
        case 9:
            self.view.backgroundColor = .systemPink
        case 10:
            self.view.backgroundColor = .systemRed
        default:
            self.view.backgroundColor = .systemRed
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
