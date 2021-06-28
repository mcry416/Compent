//
//  Queue.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/27.
//

import Foundation

public struct Queue <T>{
    var data = [T]()
    
    public func isEmpty() ->Bool{
        return data.isEmpty
    }
    
    public func count() -> Int{
        return data.count
    }
    
    public mutating func dequeue(){
        data.removeFirst()
    }
    
    public mutating func enqueue(_ element: T){
        data.append(element)
    }
    
    public mutating func peek() ->T{
        return data.first!
    }

}
