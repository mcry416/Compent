//
//  NetworkManager.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import Foundation

class NetworkManager: NetworkProtocol{
    
    static func postRequest(URLString: String, parameters: [String : Any]?, callback: @escaping (Any) -> ()) {
        BootLayer.getRequest(urlString: URLString) { (dictionary) in
            callback(dictionary)
        }
    }
    
    static func getRequest(URLString: String, parameters: [String : Any]?, callback: @escaping (Any) -> ()) {
        BootLayer.getRequest(urlString: URLString) { (dictionary) in
            callback(dictionary)
        }
    }
    
}
