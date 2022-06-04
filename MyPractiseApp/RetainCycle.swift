//
//  RetainCycle.swift
//  MyPractiseApp
//
//  Created by Md Saddam Hossain on 31/10/21.
//

import Foundation
import UIKit
import AudioToolbox


class Person{
    
    var personName: String
    var personPhn: Phone?
    
    init(name: String, personPhn: Phone?){
        self.personName = name
        self.personPhn = personPhn
    }
    deinit{
        
        print("Person deinit ")
    }
}

class Phone{
    
    var phoneName: String
    var phnOwner: Person?
    
    init(name: String, phnOwner: Person?){
        self.phoneName = name
        self.phnOwner = phnOwner
    }
    
    deinit{
        
        print("Phone deinit ")
    }
    
}
