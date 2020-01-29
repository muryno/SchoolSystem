//
//  BaseData.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/27/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import Foundation


struct  Base : Codable{
    
    var message : String?
    var status : Bool
       var data : [Dept]
    
    
    enum CodingKeys: String, CodingKey {
          case status,
            data  = "data",
            message = "message"
        
         
      }
}

struct Dept : Codable {
    var id : Int
    var departmentName : String
    var departmentCode : String
    
    enum CodingKeys : String , CodingKey{
        case id,
        departmentName = "department_name",
        departmentCode = "department_code"
    }
}

//   //post using multipart
// func upload() {
//     let data = UIImage(named: "01")!.jpegData(compressionQuality: 1.0)!
//     let params:[String:Any]=["first_name": "Bm","picture_data":data]
//     let req:Request = Request()
//     req.POST(url: url, parameters: params, completionHandler: { data,response,error in
//         print(response)
//     })
// }

//func get() {
//    let req:Request = Request()
//    let param = ["page":"2"]
//    req.getResponse(url: url, parameters: param, httpMethod: .get, completionHandler: { data,response,error in
//        print(response)
//    })
//}

