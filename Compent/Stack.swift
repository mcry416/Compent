//
//  Stack.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/27.
//

import Foundation

public struct Stack<T> {
    var array = [T]()
    
    public func isEmpty() -> Bool{
        return array.isEmpty
    }
    
    public func count() -> Int{
        return array.count
    }
    
    public mutating func push(_ element: T){
        array.append(element)
    }
    
    public mutating func pop(){
        array.popLast()
    }
    
    public func top() -> T{
        return array.last!
    }
}
