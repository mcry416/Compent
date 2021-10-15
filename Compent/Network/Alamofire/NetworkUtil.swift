//
//  NetworkUtil.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/28.
//

import Foundation
import Alamofire

enum MethodType {
    case get
    case post
}

class AlamofireLayer{
    class func requestJson(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.AF.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
               
            switch response.result {
            case .success(let json):
                finishedCallback(json)
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
            
        }
    }
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.AF.request(URLString, method: method, parameters: parameters).responseData { (response) in
            
            
            if response.response!.statusCode >= 200 && response.response!.statusCode < 300{
               finishedCallback(response)
            } else if response.response!.statusCode >= 400 {
                finishedCallback("400")
            }
    /*
            switch response.result{
            case .success(let responseString):
                print("------> NORMAL EXE.")
                finishedCallback(responseString)
                break
            case .failure(let error):
                if let httpStatusCode = response.response?.statusCode {
                    print("------> 400 EXE.")
                   switch(httpStatusCode) {
                   case 400:
                       finishedCallback("400")
                   case 401:
                       finishedCallback("400")
                   default:
                       finishedCallback("400")
                   }
                } else {

                }
                break
            }
 */
        }
        
    }
    
    class func requestCouldContinue(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.AF.request(URLString, method: method, parameters: parameters).responseData { (response) in
            
            if response.response!.statusCode >= 200 && response.response!.statusCode < 300{
                print("------> 200 EXE.")
               finishedCallback("true")
            } else if response.response!.statusCode >= 400 {
                print("------> 400 EXE.")
                finishedCallback("false")
            }

        }
        
    }
    
    class func requestString(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.AF.request(URLString, method: method, parameters: parameters).responseString { (response) in
            switch response.result{
            case .success(let responseString):
                finishedCallback(responseString)
                break
            case .failure(_):
                break
            }
        }
        
    }

}


