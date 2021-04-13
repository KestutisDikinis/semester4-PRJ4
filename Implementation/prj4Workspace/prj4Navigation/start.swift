//
//  start.swift
//  prj4Navigation
//
//  Created by Niklas Thürnau on 12.04.21.
//

import SwiftUI


struct start: View {
    var body: some View {
        VStack {
            Text("Ready to bike?")
            NavigationView{
                NavigationLink(destination: Registration()) {
                    Text("Sign-Up")
                        .foregroundColor(Color.white)
                        .padding(12)
                        .background(Color.orange)
                }
                .cornerRadius(12)
            }
        }
    }
}

struct start_Previews: PreviewProvider {
    static var previews: some View {
        start()
            .previewDisplayName("Test")
            
    }
}
