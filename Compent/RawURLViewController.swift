//
//  RawURLViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import UIKit

class RawURLViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


  /*      NetworkManager.getRequest(URLString: "https://itunes.apple.com/lookup?id=1407674824", parameters: nil) { (data) in
            print("------> DATA:\(data)")
        }
 */
        TestC.myClourse(){abc in
            print("Number is:\(abc)")
        }
        
        TestC.simulatorNet(2){ response in
            print(response)
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
