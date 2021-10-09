//
//  ClourseViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import UIKit

class ClourseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 200, y: 200, width: 40, height: 20)
        button.setTitle("Do", for: UIControl.State.normal)
        button.addTarget(self,action: #selector(doListener), for: UIControl.Event.touchDown)
        self.view.addSubview(button)
    }
    
    @objc func doListener(){
        let vc = NextClourseViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            print("------> RECORD LOG...")
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
