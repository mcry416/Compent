//
//  DesignPatternViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/2.
//

import UIKit

class DesignPatternViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var varifyArray: Array<UITableViewCell> = []

    var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("FIRST EXECUTE DEQUEUE CELL. AT:%d", indexPath.row)
        var cell = tableView.dequeueReusableCell(withIdentifier: "REUSABLE_CELL_ID", for: indexPath)
        
        NSLog("FIRST EXECUTE DEQUEUE END.")
        
        NSLog("NIL PULL.")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "REUSABLE_CELL_ID")
            NSLog("PULLING...")
        }
        
   //     cell.textLabel?.text = "NO. \(indexPath.row) s"
        cell.textLabel?.text = "FIX TEXT."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "REUSABLE_CELL_ID")
        
        print("\(cell?.textLabel?.text)")
    }
    
    private func initView(){
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "REUSABLE_CELL_ID")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
         
    }

}
