//
//  BootLayer.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import Foundation

class BootLayer{
    class func getRequest(urlString: String, callback: @escaping (Any) -> ()){
        let config = URLSessionConfiguration.default
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            callback(dictionary)
        }
        task.resume()
    }
    
    class func postRequest(urlString: String, callback: @escaping (Any) -> ()){
        let config = URLSessionConfiguration.default
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            callback(dictionary)
        }
        task.resume()
    }
    
}
