//
//  Control.swift
//  MyPractiseApp
//
//  Created by Md Saddam Hossain on 30/10/21.
//

import Foundation


public func getValue()-> Int{
    return 12
}

class Book{
    
    static var shar = Book()
     open var name = "English"
    open func getStr()->String{
        return "ok"
    }
}

class robi{
    
    var ob = Book()
   
    init(){
        let ov = ob.name
        
    }
}
