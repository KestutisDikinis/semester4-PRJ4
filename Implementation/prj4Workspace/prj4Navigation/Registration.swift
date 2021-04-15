//
//  registration.swift
//  prj4Navigation
//
//  Created by Niklas Thürnau on 13.04.21.
//

import SwiftUI

struct Registration: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordRepeat: String = ""
    @State private var fname:
        String = ""
    @State private var lname: String = ""
    @State private var terms: Bool = false
    
    private var handler = HttpHandler()
    
    var body: some View {
        
        VStack{
            Group{
                Text("Username")
                TextField("Username", text: $username)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Email")
                TextField("Email", text: $email)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Firstname")
                TextField("Firstname", text: $fname)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Lastname")
            }
            Group{
                TextField("Lastname", text: $lname)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Password")
                SecureField("Password", text: $password)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                Text("Password repeat")
                SecureField("Passwordrepeat", text: $passwordRepeat)
                    .border(Color.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Toggle(isOn: $terms) {
                    Text("Hereby I accept the Terms of Service")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            }
            /*Button(action:
            ) {
                Text("Sign-Up!")
                .foregroundColor(Color.white)
                .padding(12)
                .background(Color.orange)
            }*/
            Button(action: {handler.signUp(username: username, password: password, email: email, firstname: fname, lastname: lname, 👁: "localhost:3000/createuserprofiles")}) {
                Text("Sign me up!")
            }
            .cornerRadius(12)
        }
        .padding(36)
        
        
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
