//
//  HttpHandler.swift
//  prj4Navigation
//
//  Created by Niklas Thürnau on 14.04.21.
//

import Foundation

struct ServerMessage: Decodable{
    let res, message: String
}

public class HttpHandler {
    
    func signUp(username: String, password: String, email: String, firstname: String, lastname: String, 👁: String) -> Bool {
        
        guard let requestURL =  URL(string:  👁) else {return false}
        
        let body: [String: String] = ["USR_NAME": username, "PASS":password, "EMAIL": email, "FIRSTNAME":firstname, "LASTNAME":lastname ]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.httpBody  = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                   guard let data = data else { return }
                   let resData = try! JSONDecoder().decode(ServerMessage.self, from: data)
                   
                   if resData.res == "correct" {
                       DispatchQueue.main.async {
                           
                       }
                   }
               }.resume()
        return true
    }
}
