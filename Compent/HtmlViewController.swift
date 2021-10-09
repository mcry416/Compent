//
//  HtmlViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/22.
//

import UIKit
import Ji

class HtmlViewController: BaseViewController {
    
    private func initTest(){
        let jiDoc = Ji(htmlURL: URL(string:"https://mbd.baidu.com/newspage/data/landingshare?preview=1&pageType=1&isBdboxFrom=1&context=%7B%22nid%22%3A%22news_8936869289712491800%22%2C%22sourceFrom%22%3A%22bjh%22%7D")!)
        let titleNode = jiDoc?.xPath("//head/title")?.first
        print("title:\(titleNode?.content)")
        
        let imageNodeArray = jiDoc?.xPath("")?.first
        print(" image: \(imageNodeArray?.content)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTest()
    }


}
