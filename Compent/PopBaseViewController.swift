//
//  PopBaseViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/14.
//

import UIKit

class PopBaseViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var upView: UIView!
    
    @IBAction func showListener(_ sender: Any) {
        upView.isHidden = false
    }
    
    var button: UIButton!
    
    private func initView(){
        self.view.backgroundColor = UIColor.white
        
        button = UIButton(type: .system)
        button.setTitle("Pop", for: UIControl.State.normal)
        button.frame = CGRect(x: (self.view.frame.width / 2) - 40 , y: self.view.frame.height / 2, width: 80, height: 30)
        button.addTarget(self, action: #selector(pop), for: UIControl.Event.touchDown)
        self.view.addSubview(button)
        
  //      upView.isHidden = true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    @objc func pop(){
        /*
        let popview = PopView.init(frame:UIScreen.main.bounds)
                popview.contenView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.size.height - 191 , width: UIScreen.main.bounds.size.width, height:191 ))
        popview.contenView?.backgroundColor = UIColor.gray
        popview.showInWindow()
 */
        
        /*
        let popview = MyPopView.init(frame:UIScreen.main.bounds)
        popview.contentView = UIView.init(frame: CGRect.init(x: 25, y: UIScreen.main.bounds.size.height - 200 , width: (UIScreen.main.bounds.size.width - 50), height:200 ))
        popview.contentView?.backgroundColor = UIColor.gray
        popview.show()
 */
        
        
        let popVC = PopViewController()
        popVC.modalPresentationStyle = .popover
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.sourceView = button
   //     popVC.popoverPresentationController?.sourceRect = button.bounds
        popVC.preferredContentSize = CGSize(width: self.view.bounds.width,height: self.view.frame.height)
        popVC.popoverPresentationController?.permittedArrowDirections = .unknown
        self.present(popVC, animated: true, completion: nil)
        
        
    }
}
