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
