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
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1").offset(x: -100, y: -200)
                )
            }
            .searchable(text: $text,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("SwiftUI, React, UI Design")) { // search suggestion
                ForEach(suggestions) { suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done") })
        }
    }
    
    var content: some View {
        ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .background(Color("Background"))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .bold()
                    Text(item.text)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.vertical, 4)
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    SearchView() 
}
