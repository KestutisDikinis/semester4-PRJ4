//
//  Login.swift
//  prj4Navigation
//
//  Created by Kestutis DIkinis on 14/04/2021.
//

import SwiftUI

struct Login: View{
    
    @State private var usernameEmail: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack{
            Group{
                Text("Username or Email")
                TextField("Username", text: $usernameEmail)
                    .border(Color(red: 236/255, green: 78/255, blue: 32/255))
            }
            Group{
                Text("Password")
                SecureField("Password", text: $password)
                    .border(Color(red: 236/255, green: 78/255, blue: 32/255))
            }
            Button(action: {Text("Hello There")}) {
                Text("Login!")
                .foregroundColor(Color.white)
                .padding(12)
                .background(Color(red: 236/255, green: 78/255, blue: 32/255))
            }
            .cornerRadius(12)
        }
        .padding(40)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
