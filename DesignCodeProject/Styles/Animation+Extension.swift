//
//  Animation+Extension.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 23.04.2024.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
