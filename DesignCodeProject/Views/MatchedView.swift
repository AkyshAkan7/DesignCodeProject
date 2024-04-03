//
//  MatchedView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 03.04.2024.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 12) {
                    Text("20 sections - 3 hours")
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    Text("SwiftUI")
                        .font(.largeTitle.bold())
                        .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .foregroundStyle(.white)
                .background(
                    Color.red.matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    
                    Text("SwiftUI")
                        .font(.largeTitle.bold())
                        .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("20 sections - 3 hours")
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                }
                .padding(20)
                .foregroundStyle(.black)
                .background(
                    Color.blue.matchedGeometryEffect(id: "background", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    MatchedView()
}
