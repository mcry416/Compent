//
//  AutoInferenceViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/29.
//

import UIKit
import Alamofire

class AutoInferenceViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func initData(_ url : String){
        let tempURLArray: Array<String> = Array<String>()
        AlamofireLayer.requestData(MethodType.get, URLString: url, parameters: nil) { result in
            print("------> BASIC DATA:\(result)")
            if result != nil{
                var nextURL: String = url
            }
        }
        
    }

}
