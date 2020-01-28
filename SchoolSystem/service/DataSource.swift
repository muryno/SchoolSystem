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

    //create user account
    func CreateUserAccount(parameters: [String : String],completion :@escaping(Result<UserBase,Error>)->Void) {
    
        let validUrl = URL(string: "http://192.168.1.18:5000/api/student/register")!
        print("\(validUrl)")
        let postRequest = getRequestPostBody(validUrl: validUrl,parameters: parameters)
        
            URLSession.shared.dataTask(with: postRequest as URLRequest) { (data, responds, error) in
                    
                    if let respondcode = responds as? HTTPURLResponse{
                        print("API Status code \(respondcode.statusCode)")
                    }
                    
                    guard let datas = data , error==nil else{

                        completion(.failure(error!))
                        return
                    }
                    
                    do{
                        
                        let data = try JSONDecoder().decode(UserBase.self, from: datas)
                        completion(.success(data))
                        
                    }catch let serializationError{
                        
                        completion(.failure(serializationError))
                    }
                    
                }.resume()
    
    }
    
    
    func Login(parameters: [String:String],completion:@escaping(Result<UserBase,Error>)->Void)  {
       
        let validUrl = URL(string: "http://192.168.1.23:5000/api/student/login")!
        
        
        let postRequest = getRequestPostBody(validUrl: validUrl,parameters: parameters)

        
        URLSession.shared.dataTask(with: postRequest as URLRequest){(data,responds,error)  in
            
      
                if let respondcode = responds as? HTTPURLResponse{
                    print("API Status code \(respondcode.statusCode)")
                }
                
                guard let datas = data , error==nil else{

                   
                    completion(.failure(error!))
                    return
                }
                
                do{
                    
                    let data = try JSONDecoder().decode(UserBase.self, from: datas)
                    
                    print(data) //whole project
                     print(data.status) //200.0
                    print(data.message)
                    completion(.success(data))
                    
                }catch let serializationError{
                    
                    completion(.failure(serializationError))
                }
                
            }.resume()
        
    }
    

    
   
    
    
    func GetDepartment(completion :@escaping(Result<Base,Error>)->Void){
        let validUrl = URL(string: "http://192.168.1.23:5000/api/department")!

                URLSession.shared.dataTask(with: validUrl) { (data, responds, error) in
                    
                    if let respondcode = responds as? HTTPURLResponse{
                        print("API Status code \(respondcode.statusCode)")
                    }
                    
                    guard let datas = data , error==nil else{
                     //   print("API Error \(error!.localizedDescription)")
                        completion(.failure(error!))
                        return
                    }
                    
                    
                    do{
        //                let json =  try JSONSerialization.jsonObject(with: datas, options: [])
        //                print(json)
                        let gist = try JSONDecoder().decode(Base.self, from: datas)
                        completion(.success(gist))
                    }catch let serializationError{
                        completion(.failure(serializationError))

                        //print(serializationError.localizedDescription)
                    }
                    
                    
                    
                }.resume()
    }

}





//url request
func getRequestPostBody(validUrl : URL ,parameters : [String:String])->NSMutableURLRequest{
 
   
    let request = NSMutableURLRequest(url: validUrl)
    //  uncomment this and add auth token, if your project needs.
    //  let config = URLSessionConfiguration.default
    //  let authString = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMywiUGFzc3dvcmQiOiIkMmEkMTAkYVhpVm9wU3JSLjBPYmdMMUk2RU5zdU9LQzlFR0ZqNzEzay5ta1pDcENpMTI3MG1VLzR3SUsiLCJpYXQiOjE1MTczOTc5MjV9.JaSh3FvpAxFxbq8z_aZ_4OhrWO-ytBQNu6A-Fw4pZBY"
    //  config.httpAdditionalHeaders = ["Authorization" : authString]

    request.httpMethod = "POST"
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])

    return request
}
