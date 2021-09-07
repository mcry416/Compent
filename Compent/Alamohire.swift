//
//  Alamohire.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/4.
//

import Foundation

class Alamohire {
    
    public var url: String!
    public var header: String!
    public var language: String!
    
    /*
    public func AM() -> Alamohire {
        return Alamohire()
    }
 */
    
    public func url(_ url: String) -> Alamohire {
        self.url = url
        return self
    }
    
    public func header(_ header: String) -> Alamohire {
        self.header = header
        return self
    }
    
    public func language(_ language: String) -> Alamohire {
        self.language = language
        return self
    }
    
}
