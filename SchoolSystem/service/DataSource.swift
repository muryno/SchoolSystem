//
//  DataSource.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import Foundation


class DataService {
    
      static let shared = DataService()

    
    func CreateAccount(parameters: [ URLQueryItem],completion :@escaping(Result<User,Error>)->Void) {
       
        let postComponent = createUrlComponnent(path: "/student/register")
        
           guard let validUrl = postComponent.url else{
                print("URL component fail ...")
                return
            }
        
    
        let postRequest = getRequestPostBody(validUrl: validUrl,parameters: parameters)
        
        URLSession.shared.dataTask(with: postRequest) { (data, responds, error) in
            
            
        }
    
    }
}


func createUrlComponnent(path : String)-> URLComponents{
    var urlComponent = URLComponents()
     urlComponent.scheme = "http"
     urlComponent.host = "192.168.43.76:8000/api/"
     urlComponent.path  = path

    return urlComponent
}


func getRequestPostBody(validUrl : URL ,parameters: [URLQueryItem])->URLRequest{
 
  var components = URLComponents(url: validUrl, resolvingAgainstBaseURL: false)!

  components.queryItems = parameters

  let query = components.url!.query
    
    
    var request = URLRequest(url: validUrl)
    request.httpMethod = "POST"
    request.httpBody = Data(query!.utf8)
    
    return request
}
