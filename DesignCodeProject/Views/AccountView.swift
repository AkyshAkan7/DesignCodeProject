//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Akysh Akan on 18.03.2024.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "Kazakhstan")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @ObservedObject var coinModel = CoinModel()

    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/v2/addresses")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
            // printing data from api
            print(String(decoding: data, as: UTF8.self))
        } catch {
            address = Address(id: 1, country: "Error fetching")
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                profile
                
                menu
                
                Section {
                    Toggle(isOn: $isLiteMode, label: {
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    })
                }
                .foregroundStyle(.primary)
                
                links
                
                coins
                
                Button {
                    isLogged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
            }
            .task {
                await fetchAddress()
            }
            .task {
                await coinModel.fetchCoins()
            }
            .refreshable {
                await fetchAddress()
                await coinModel.fetchCoins()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button { dismiss() } label: { Text("Done") })
        }
    }
    
    // MARK: - Profile View
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 150, y: 40)
                        .scaleEffect(0.6)
                )
            Text("Akan Akysh")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text(address.country)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    // MARK: - Menu View
    
    var menu: some View {
        Section {
            //first way
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            //second way
            NavigationLink { Text("SwiftUI") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .foregroundStyle(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    // MARK: - Links View
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundStyle(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: { isDeleted.toggle() }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundStyle(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .listRowSeparator(.hidden)
        .foregroundStyle(.primary)
    }
    
    var coins: some View {
        Section("Coins") {
            ForEach(coinModel.coins) { coin in
                HStack {
                    AsyncImage(url: URL(string: coin.logo)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
    
    var pinButton: some View {
        Button { isPinned.toggle()  } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

#Preview {
    AccountView()
}
