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
    
    func signUp(username: String, password: String, email: String, firstname: String, lastname: String) -> Void {
        let url = URL(string: "http://localhost:3000/user-profiles")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let body: [String: String] = ["USR_NAME": "username", "PASS":"password", "EMAIL": "email", "FIRSTNAME":"firstname", "LASTNAME":"lastname" ]
        
        let body: [String: String] = ["USR_NAME": username, "PASS":password, "EMAIL": email, "FIRSTNAME":firstname, "LASTNAME":lastname ]
        
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
    
    //will not work as cant get my username
    func logIn(usernameEmail: String, password: String, url: String) -> Void {
        let url = URL(string: "http://localhost:3000/signup")
        guard let requestUrl = url else {fatalError()}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["USR_NAME": usernameEmail, "PASS":password ]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                if let profile = try? JSONDecoder().decode([httpProfile].self, from: data){
                    print(profile)
                } else {
                    print(response)
                }
                print("Success")
            } else if let error = error {
                print("I do not understand wtf is this \(error)")
            }
            
        }
        task.resume()
    }
}
