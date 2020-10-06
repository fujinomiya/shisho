//
//  Sidebar.swift
//  shisho
//
//  Created by fujinomiya on 7.10.2020.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: Text("Item 1"))
            {
                Text("1s")
            }
            
            NavigationLink(destination: Text("Item 2"))
            {
                Text("2s")
            }
            
            NavigationLink(destination: Text("Item 3"))
            {
                Text("3s")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
