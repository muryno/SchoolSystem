//
//  User.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import Foundation



struct  UserBase : Codable{
    
    var message : String
    var status : Bool
       var data : User?
    
    
    enum CodingKeys: String, CodingKey {
          case status,
            data  = "data",
            message = "message"
        
         
      }
}
struct User : Codable{
    var id  : Int?
    var status : Int?
    var fname : String?
     var email : String?
     var age : String?

    var phone : String?
    var lname : String?


    var matric : String?
    var appKey: String?
    var image : String?
    
    enum CodingKeys: String, CodingKey {
        case id   ,appKey, status,age,
        image = "profile_image",
          fname  = "first_name",
        phone = "phone",
        email = "email",
        matric = "matric_number",
        lname = "last_name"
    }

}





struct Department :Codable{
    var id  : Int?

    var department_name : String?
   var department_code : String?
   var faculty_id : String?

}

