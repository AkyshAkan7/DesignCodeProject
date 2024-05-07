//
//  SearchView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 07.05.2024.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
                    Text(item.title)
                }
            }
            .searchable(text: $text, 
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("SwiftUI, React, UIDesign"))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done") })
        }
    }
}

#Preview {
    SearchView() 
}
