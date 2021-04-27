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

private struct httpProfile: Decodable{
    var USR_NAME, FIRSTNAME, LASTNAME, PASS, EMAIL: String
}
import UIKit

public class HttpHandler {
    
    func testSign() -> Void {
        let url = URL(string: "http://localhost:3000/user-profiles")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["USR_NAME": "username", "PASS":"password", "EMAIL": "email", "FIRSTNAME":"firstname", "LASTNAME":"lastname" ]
        
//        let body: [String: String] = ["USR_NAME": username, "PASS":password, "EMAIL": email, "FIRSTNAME":firstname, "LASTNAME":lastname ]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        request.httpBody = finalBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                if let profile = try? JSONDecoder().decode([httpProfile].self, from: data){
                    print(profile)
                } else {
                    print(response)
                }
                print("Success")
            } else if let error = error {
                print("HTTP Request failed \(error)")
                print("WHAT THE HELL IS GOING ON=!")
            }
            
        }
        task.resume()
        
    }
    
    func signUp(username: String, password: String, email: String, firstname: String, lastname: String) -> String {
        let url = URL(string: "http://localhost:3000/user-profiles")!
        
        var responseMessage = "open"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = ["USR_NAME": username, "PASS":password, "EMAIL": email, "FIRSTNAME":firstname, "LASTNAME":lastname ]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        request.httpBody = finalBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                if let profile = try? JSONDecoder().decode([httpProfile].self, from: data){
                    print(profile)
                    responseMessage="success"
                    
                } else {
                    print(response)
                }            
                print("Success")
                
            } else if let error = error {
                print("HTTP Request failed \(error)")
                print("WHAT THE HELL IS GOING ON=!")
                responseMessage = "error"
            }
            
        }
        task.resume()
        return responseMessage
    }
    
    func logIn(usernameEmail: String, password: String) -> Bool {
        
        let url = URL(string: "http://localhost:3000/user-profiles/login")
        guard let requestUrl = url else {fatalError()}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = ["email": usernameEmail, "password":password ]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        
        request.httpBody = finalBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                globalToken = dataString
                print("Response data string:\n \(dataString)")
                print(globalToken)
                } else if let error = error {
                print("This should not happen \(error)")
            }
        }
        whoIam(token: globalToken)
        task.resume()
        
        return false
    }
    
    
    //funcion to access profile information
    //retruns user ID
    //can be used for profile data
    
    
    func whoIam(token: String) -> Int {
        let url = URL(string: "http://localhost:3000/whoAmI")
        guard let requestUrl = url else {fatalError()}
        var request = URLRequest(url: requestUrl)
        print("IM HeERE")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        return -1
    }
    
    func login2(usernameEmail: String, password: String) -> Void {
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI5IiwibmFtZSI6Iktlc3Rva2FzIiwiZW1haWwiOiJLZXN0b2thc0BnbWFpbC5jb20iLCJpYXQiOjE2MTkyOTYxODEsImV4cCI6MTYxOTMxNzc4MX0.tmnghpttLJlgK1-PcrgQ9WcwESSA2lwcmfFBM2TGbnY"
        let url = URL(string: "http://localhost:3000/whoAmI")!

        // prepare json data

        // create post request
        var request = URLRequest(url: url)
        // insert json data to the request
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }

        task.resume()
    }
    

}
