//
//  Profile.swift
//  prj4Navigation
//
//  Created by Marek Broz on 4/14/21.
//

import SwiftUI

struct profileTest: View {
    var body: some View {
        VStack{
            Image("mark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.top, 30)
                .frame(alignment: .center);

            Text("Markuvius420")
                .font(.system(size: 21, weight: .medium, design: .default))
                .frame(alignment: .center);
                
            Text("Venlo")
                .font(.system(size: 15, design: .default))
                .frame(alignment: .center);

            Form {
                Section(header: Text("PROFILE INFORMATION")){
                    HStack{
                        Text("First Name")
                        Spacer()
                        Text("Marek")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack{
                        Text("Last Name")
                        Spacer()
                        Text("Brož")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack{
                        Text("Email")
                        Spacer()
                        Text("JuliaSartori@student.fontys.nl")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack{
                        Text("City")
                        Spacer()
                        Text("Venlo")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack{
                        Text("Birthday")
                        Spacer()
                        Text("1/1/2015")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                }
                Section{
                    Button(action:  {
                            print("Edit Profile Information")
                    }) {Text("Edit Profile Information")
                    }
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        profileTest()
    }
}
