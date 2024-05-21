//
//  SectionRow.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 20.05.2024.
//

import SwiftUI

struct SectionRow: View {
    var section: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(section.logo)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay(CircularView(value: section.progress))
            VStack(alignment: .leading, spacing: 8) {
                Text(section.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                Text(section.title)
                    .fontWeight(.semibold)
                Text(section.text)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                ProgressView(value: section.progress)
                    .tint(.white)
                    .frame(maxWidth: 132)
            }
        }
        .padding(20)
    }
}

#Preview {
    SectionRow()
}
