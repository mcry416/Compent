//
//  MenuViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: Array<String> = ["My","Gallery","Settings","Feedback","About"]
    var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MENU_ID", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        switch indexPath.row {
        case 0:
            print("------>")
        default:
            break
        }
    }
    
    private func initView(){
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "MENU_ID")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }

}
