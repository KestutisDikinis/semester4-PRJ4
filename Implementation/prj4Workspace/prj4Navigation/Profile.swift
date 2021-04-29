//
//  Profile.swift
//  prj4Navigation
//
//  Created by Marek Broz on 4/14/21.
//

import SwiftUI



//container view that shows all the content
struct Profile: View {
    
    @State var selection:Int = 0
    
    //booleans for modifying the button background color
    @State var profileSelected = false
    @State var routesSelected = false
    @State var pointsSelected = false
    
    
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
            
            //Text("Nav. bar placeholder")
            HStack{
                
                Button(action: {
                    print("Profile Information")
                    selection = 1
                }) {
                    Text("Profile Information")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .offset(y: 0)
                .buttonStyle(MyButtonStyle())
                
                Button(action: {
                    print("Route History")
                    selection = 2
                }) {
                    Text("Route History")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .offset(y: 0)
                .buttonStyle(MyButtonStyle())
                     
                    
                   
                    
                        //.overlay(
                          //  RoundedRectangle(cornerRadius: 10.0)
                          //     .stroke(lineWidth: 1.0)
                                
                                //.shadow(color: .blue, radius: 0.0)
                       //)
                    //if profileSelected == true {
                      //  .background(Color(hex: 0xF2F6F7))
                   // }
                
                
            }
            
            
            //for swiping between pages functionality
            ZStack{
                VStack{
                    //PLACEHOLDER FOR selection parameter for the nav bar to select the correct page
                    TabView(selection: $selection){
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
                        .tag(1)
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
                        .tag(2)
                    
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                   
                }
                }
               
            
            
        }
    }
}
//extension for letting us import our own hex colours
// 4E64E1 blue
// 2E2B28 tint black
// EC4E20 blue
// F7F9FA tint white
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

//styling configuration for the nav buttons that are applied
struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding(5)
      
      .foregroundColor(.blue)
        .background(configuration.isPressed ? Color(hex: 0x2E2B28) : Color.white)
      .cornerRadius(10.0)
    
    
        
        //.offset(x: 10)
        //.overlay(
          //  RoundedRectangle(cornerRadius: 10.0)
            //    .offset(x: 10)
              //  .stroke(lineWidth: 1.0)
                //.shadow(color: .blue, radius: 0.0)
        //)
  }

}


//Renders the code avove in a preview window
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Profile()
                
        }
    }
}
