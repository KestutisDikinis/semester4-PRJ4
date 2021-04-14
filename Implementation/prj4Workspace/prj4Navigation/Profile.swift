//
//  Profile.swift
//  prj4Navigation
//
//  Created by Marek Broz on 4/14/21.
//

import SwiftUI

struct profileTest: View {
    var body: some View {
            HeaderInfo() .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center);
            Text("ss")
    }
}

struct HeaderInfo: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("mark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(90)
                
            }
        
        VStack(alignment: .leading) {
            Text("Markuvius420")
                .font(.system(size: 21, weight: .medium, design: .default))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center);
            Text("Venlo")
                .font(.system(size: 15, design: .default))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center);
                
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        profileTest()
            .padding(.top, 35)
        
    }
}
