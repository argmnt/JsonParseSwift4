//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Yağız Gazibaba on 07/02/2018.
//  Copyright © 2018 Yağız Gazibaba. All rights reserved.
//

import UIKit

struct Course : Decodable {
    let id : Int
    let name : String
    let link : String
    let imageUrl : String
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
    
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard  let url = URL(string: jsonUrlString) else
            { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else  { return }
//
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                // Swift 2 /3 /ObjC
//                guard let json = try JSONSerialization.jsonObject(with: data,
//                options: .mutableContainers) as? [String: Any] else
//                { return }
//                let course = Course(json:json)
               
                
            } catch let jsonErr {
                print(jsonErr)
            }
            
        }.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
      //   let myCourse = Course(id:1, name: "my course", link: "some link", imageUrl: "some image url")
      //  print(myCourse)
        
    }

    
   
   
    
    


}

