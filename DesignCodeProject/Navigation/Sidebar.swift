//
//  Sidebar.swift
//  iOS15
//
//  Created by Akysh Akan on 2024-06-23.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                Label("Learn Now", systemImage: "house")
                Label("Courses", systemImage: "square.grid.2x2")
                Label("Livestreams", systemImage: "tv")
            }
            .listStyle(.sidebar)
            .navigationTitle("DesignCode")
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
