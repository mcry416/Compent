//
//  SlideDataSource.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/9.
//

import Foundation
import UIKit

class SlideDataSource: NSObject, UITableViewDataSource{
    
    var CELL_ID = "SLIDE_CELL_ID"
    
    var dataArray: Array<String>!
    
    init(dataArray: Array<String>) {
        self.dataArray = dataArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CELL_ID)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }

}
