//
//  KVOViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/27.
//

import UIKit

class KVOViewController: BaseViewController {
    
    var object = Person()
    
    private var objectContext: Int = 1100

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     //   object.addObserver(self, forKeyPath: "name", options: NSKeyValueObservingOptions.new, context: &objectContext)
        
        
        let reflect: Mirror = Mirror(reflecting: object)
        print("------> MIRROR TYPE: \(reflect.subjectType)")
        
        for object in reflect.children {
            print("------> ATTR NAME :\(object.label!)")
            print("------> ATTR VALUE:\(object.value)")
        }
        
        

    }
    /*
    deinit {
        object.removeObserver(self, forKeyPath: "name", context: &objectContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &objectContext {
            print("------> VALUE:\(change?[NSKeyValueChangeKey.newKey])")
        }
        
    }
 */
    
}
