//
//  NotifViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/27.
//

import UIKit

class NotifViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate{
    
    var tableView: UITableView!
    var dataImage: Array<String> = ["ef", "ef","ef", "ef","ef", "ef","ef", "ef","ef", "ef"]
    var dataContent: Array<String> = ["Test text", "子曰：学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？","子禽问于子贡曰：“夫子至于是邦也，必闻其政，求之与？抑与之与？”子贡曰：“夫子温、良、恭、俭、让以得之。夫子之求之也，其诸异乎人之求之与？”", "子贡曰：“贫而无谄，富而无骄，何如？”子曰：“可也。未若贫而乐，富而好礼者也。”子贡曰：“《诗》云：‘如切如磋，如琢如磨’，其斯之谓与？”子曰：“赐也，始可与言《诗》已矣，告诸往而知来者。”", "5", "6", "7", "8", "9", "10"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MY_CELL", for: indexPath)
        
        let imageView = cell.viewWithTag(1001) as! UIImageView
        imageView.image = UIImage(named: dataImage[indexPath.row])
        
        let contentLabel = cell.viewWithTag(1002) as! UILabel
        contentLabel.text = dataContent[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-----> CLICK.")
        pop()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    private func initView(){
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.register(MyCell.self, forCellReuseIdentifier: "MY_CELL")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
    }
    
    @objc func pop(){
        let popVC = PopViewController()
        popVC.modalPresentationStyle = .popover
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.sourceView = tableView
        popVC.popoverPresentationController?.sourceRect = tableView.bounds
        popVC.preferredContentSize = CGSize(width: 100,height: 100)
        popVC.popoverPresentationController?.permittedArrowDirections = .down
        self.present(popVC, animated: true, completion: nil)
    }
    
}
