//
//  ModalView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 10.05.2024.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal = true
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            switch model.selectedModal {
            case .signUp: SignUpView()
            case .signIn: SignInView()
            }
            
            // close button
            Button {
                withAnimation() {
                    showModal = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
        }
    }
}

#Preview {
    ModalView()
        .environmentObject(Model())
}
