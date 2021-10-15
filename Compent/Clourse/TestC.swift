//
//  TestC.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import Foundation

class TestC{
    static func myClourse(callback: @escaping (Any) -> ()){
        var temp: Int = 12
        callback(temp)
    }
    
    static func simulatorNet(_ networkQuality: Int, callbak: @escaping (Any) -> ()){
        var result: String = "Network.Init"
        switch networkQuality {
        case 0:
            result = result + "/falied."
            callbak(result)
        case 1:
            result = result + "/normal."
            callbak(result)
        case 2:
            result = result + "/pretteyGood."
            callbak(result)
        default:
            result = result + "/falied."
            callbak(result)
        }
    }
}
