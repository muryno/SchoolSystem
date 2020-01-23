//
//  User.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import Foundation


struct User : Codable{
    var id  : Int
    var status : Int?
    var first_name : String?
     var email : String?
     var age : String?
     var last_name : String?
    var phone : String?
    
    var department_id : Int?
    
    var appKey : String?
    
    var matric_number :String?
    
    var department : Department?
    
    enum CodingKeys: String, CodingKey {
        case id, status , email, age, last_name ,phone,department_id, appKey ,matric_number , department,
          first_name  = "first_name"
    }

}





struct Department :Codable{
    var id  : Int?

    var department_name : String?
   var department_code : String?
   var faculty_id : String?

}

