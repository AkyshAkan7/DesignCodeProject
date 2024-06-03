//
//  ContentView.swift
//  Shared
//
//  Created by Akysh Akan on 2024-06-16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: Model
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showAccount") var showAccount = false
    
    init() {
        showAccount = false
    }
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .notifications:
                    NotificationsView()
                case .library:
                    LibraryView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            
            TabBar()
            
            if model.showModal {
                ModalView()
                    .accessibilityIdentifier("Identifier")
            }
        }
        .dynamicTypeSize(.large ... .xxLarge)
        .sheet(isPresented: $showAccount) {
            AccountView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
