//
//  Model.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 23.04.2024.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
