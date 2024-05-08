//
//  Suggestion.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 07.05.2024.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
