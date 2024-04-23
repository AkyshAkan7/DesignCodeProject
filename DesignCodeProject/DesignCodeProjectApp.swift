//
//  DesignCodeProjectApp.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 11.03.2024.
//

import SwiftUI

@main
struct DesignCodeProjectApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Model())
}
