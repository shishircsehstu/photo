//
//  ViewController.swift
//  MyPractiseApp
//
//  Created by Md Saddam Hossain on 16/10/21.
//

import UIKit

struct personInfo{
    
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
        //ok
    }
}


class ViewController: UIViewController {
    var dispatch = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
      //  mapImplement()
        
    }
    func filterImplement(){
        
        let numbers = [1,3,4,5,7]
        let newArray = numbers.filter { $0 > 4 }
        // return greater than 4 value
        print(newArray)
        //Output:  [5, 7]
        
        let totalValueGreaterThanFour = numbers.filter{$0>4}.count
        print(totalValueGreaterThanFour)
        // output 2. because 2 value(5,7) greater than 4
        
        let nameArray = ["shakil","jack","Mack","Rajjk"]
        let newNames = nameArray.filter{$0.count==4}
        // return whose name contains 4 letter.
        print(newNames)
        //Output: ["jack", "Mack"]
    }
    

    func mapImplement(){
        
        let numbers = [1,2,5,7]
        let doubled = numbers.map { $0 * 2 }
        print(doubled)
        //Output: [2, 4, 10, 14]
        
        
        let names = ["azad","Adam","John"]
        let upperLetter = names.map{$0.uppercased()}
        print(upperLetter)
        //output: ["AZAD", "ADAM", "JOHN"]
        
        var persons = [personInfo]()
        
        persons.append(personInfo(name: "Azad", age: 21))
        persons.append(personInfo(name: "Joss", age: 17))
        persons.append(personInfo(name: "Jacks", age: 30))
        persons.append(personInfo(name: "Rafik", age: 20))
        
        let ages = persons.map{ $0.age }
        print(ages)
        //Output: [21, 17, 30, 20]
        
        
     //   var perOb = Person.init(personName: "kff")
        print()
        
    }
    class Person{
        
    var personName = "we"
       weak var personPhn: Phone?
        
//        init(name: String){
//            self.personName = name
//        }
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
    
    
    func blockOperationApply(){
        
        let operationQueues = OperationQueue()
        
        let bo1 = BlockOperation{ [self] in
            let sum1 = claculate1()
            print("sum1 = ",sum1)
            
        }
        let bo2 = BlockOperation{ [self] in
            let sum2 = claculate2()
            print("sum2 = ",sum2)
        }
        
        operationQueues.maxConcurrentOperationCount = 2
        operationQueues.addOperation(bo1)
        operationQueues.addOperation(bo2)
        sleep(UInt32(1))
        bo2.cancel()
        
    }
    func claculate1()->Int{
        
        print("sum1")
        var sum = 0;
        for i in 0..<10000002{
            sum+=i;
        }
        return sum
    }
    func claculate2()->Int{
        
        print("sum2")
        var sum = 0;
        for i in 0..<10000005{
            sum+=i;
        }
        return sum
    }
    
    func downloadImage(indx: Int,imgURL: URL, completion: @escaping (UIImage?)->()){
        
        print("Running.. ", indx)
        URLSession.shared.dataTask(with: imgURL) { (data, respnse, error) in
            if let error = error {
                print("Error: \(error)")
                
            }else if let data = data {
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    
                    if let img = image{
                        completion(img)
                    }else{
                        completion(nil)
                    }
                }
            }
        }.resume()
    }
    
    func getSum(indx: Int)->Int{
        
        print("Calling, ",indx)
        var sum=0
        for i in 0..<10000000{
            sum+=i
        }
        return sum
    }
}


class singleton{
    
    static var share = singleton()
    public var value: Int = 5
}
