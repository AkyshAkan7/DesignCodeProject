//
//  HomeView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 25.03.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            
            Color.clear.frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured")
        )
    }
}

#Preview {
    HomeView()
}
