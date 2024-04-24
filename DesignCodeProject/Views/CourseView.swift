//
//  CourseView.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 21.04.2024.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
                .onChange(of: show) { oldValue, newValue in
                    fadeOut()
                }
        }
        .onAppear {
            fadeIn()
        }
    }
    
    // MARK: - Views
    
    var cover: some View {
        // Geometry Reader for parallax effect
        GeometryReader { proxy in
            let minY = proxy.frame(in: .global).minY
            let scrollY = minY > 0 ? minY : 0
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500 + scrollY)
            .foregroundStyle(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    // make it slower than actual scroll
                    .offset(y: scrollY * -0.8)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: -scrollY)
                    // scaling background
                    .scaleEffect(scrollY / 1000 + 1)
                    // blur
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: -scrollY)
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY * -0.6)
            )
        }
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                model.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.bold())
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.subtitle)
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            
            Divider()
                .opacity(appear[0] ? 1 : 0)
            
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                
                Text("Taught by Meng To")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
    }
    
    // MARK: - Functions
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
}

struct CourseViewPreview: PreviewProvider {
    @Namespace static var namespace
     
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
