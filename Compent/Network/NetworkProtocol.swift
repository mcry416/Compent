//
//  NetworkProtocol.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import Foundation

protocol NetworkProtocol {
    static func postRequest(URLString: String, parameters : [String : Any]?, callback: @escaping (_ result: Any) -> ())
    static func getRequest(URLString: String, parameters : [String : Any]?,callback: @escaping (_ result: Any) -> ())
}
