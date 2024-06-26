//
//  NavigationBar.swift
//  iOS15
//
//  Created by Akysh Akan on 2024-07-16.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @State var showSheet = false
    @Binding var contentHasScrolled: Bool
    
    @EnvironmentObject var model: Model
    @AppStorage("showAccount") var showAccount = false
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        ZStack {
            
            Color.clear
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
                .frame(maxHeight: .infinity, alignment: .top)
                .blur(radius: contentHasScrolled ? 5 : 0)
                .opacity(contentHasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: contentHasScrolled ? 22 : 34, weight: .bold)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .opacity(contentHasScrolled ? 0.7 : 1)
            
            HStack(spacing: 16) {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 14, opacity: 0.4)
                }
                .sheet(isPresented: $showSheet) {
                    SearchView()
                }
                
                Button {
                    withAnimation {
                        if isLogged {
                            showAccount = true
                        } else {
                            model.showModal = true
                        }
                    }
                } label: {
                    avatar
                }
                .accessibilityElement()
                .accessibilityLabel("Account")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .offset(y: model.showNav ? 0 : -120)
        .accessibility(hidden: !model.showNav)
        .offset(y: contentHasScrolled ? -16 : 0)
    }
    
    @ViewBuilder
    var avatar: some View {
        if isLogged {
            AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                switch phase {
                case .empty:
                    Color.white
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Color.gray
                @unknown default:
                    Color.gray
                }
            }
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 18, opacity: 0.4)
            .transition(.scale.combined(with: .slide))
        } else {
            LogoView(image: "Avatar Default")
        }
    }
}

#Preview {
    NavigationBar(contentHasScrolled: .constant(false))
        .environmentObject(Model())
}
