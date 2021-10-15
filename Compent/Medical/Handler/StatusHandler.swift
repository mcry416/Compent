//
//  StatusHandler.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import Foundation

class StatusHandler{
    
    public static func isExistUser() -> Bool{
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "user")
    }
}
