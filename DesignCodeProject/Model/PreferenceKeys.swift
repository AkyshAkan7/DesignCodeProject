//
//  PreferenceKeys.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 31.03.2024.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
