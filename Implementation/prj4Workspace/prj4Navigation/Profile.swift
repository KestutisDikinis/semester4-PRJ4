//
//  Profile.swift
//  prj4Navigation
//
//  Created by Marek Broz on 4/14/21.
//

import SwiftUI

//container view that shows all the content
struct profileTest: View {
    var body: some View {
        //Vertical container that holds all elements
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
            
            Text("Nav. bar placeholder")
            
            //for swiping between pages functionality
            ZStack{
                TabView{
                    //Embedded form for styling the HStacks
                    //Profile info section
                    Form {
                        //Added sections for spacing between other sections and naming groups

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
                            //Added action button for user to interact with
                            Button(action:  {
                                    print("Edit Profile Information")
                            }) {Text("Edit Profile Information")
                            }
                        }
                    }
                    //History group
                    Form {
                        //Section name
                        Section(header: Text("ROUTES HISTORY")){
                            //Spacing between each route entry
                            HStack{
                                Image("route")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(10)
                                VStack(alignment: .leading){
                                    Text("TITLE + description")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .offset(y:5)
                                    Text("89km")
                                        .offset(y:20)
                                    Text("21.2.2021")
                                        .offset(x:175)
                                }
                            }
                            HStack{
                                Image("route")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(10)
                                VStack(alignment: .leading){
                                    Text("TITLE + description")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .offset(y:5)
                                    Text("89km")
                                        .offset(y:20)
                                    Text("21.2.2021")
                                        .offset(x:175)
                                }
                            }
                            HStack{
                                Image("route")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(10)
                                VStack(alignment: .leading){
                                    Text("TITLE + description")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .offset(y:5)
                                    Text("89km")
                                        .offset(y:20)
                                    Text("21.2.2021")
                                        .offset(x:175)
                                }
                            }
                        }
                    }
                
                }
                .tabViewStyle(PageTabViewStyle())
            }
            
            
        }
    }
}

//Renders the code avove in a preview window
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        profileTest()
    }
}
