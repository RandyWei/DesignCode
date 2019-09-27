//
//  HomeList.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var isPresented = false
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        Text("Courses")
                            .font(.largeTitle)
                            .bold()
                        Text("22 courses").foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 70)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 30){
                        ForEach(coursesData) {item in
                            GeometryReader { geometry in
                                CourseView(course: item)
                                    .onTapGesture {
                                        self.isPresented.toggle()
                                }
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -20), axis: (x: 0, y: 10.0, z: 0))
                            }.frame(width: 246, height: 360)
                        }
                    }
                    .padding(.leading, 50)
                    .padding(.top, 30)
                    .padding(.trailing, 50)
                }
                .sheet(isPresented: $isPresented) { ContentView() }
                
                CertificateRow()
                
                Spacer()
            }.padding(.top, 40)
        }
    }
}

struct CourseView:View {
    var course:Course
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
                .font(.title)
                .bold()
                .padding()
                .lineLimit(4)
                .foregroundColor(Color.white)
                .padding(.trailing, 50)
            
            Spacer()
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI", image: "Illustration1", color: Color("background3"), shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course", image: "Illustration4", color: Color("background4"), shadowColor: Color("backgroundShadow4")),
    Course(title: "Build an app with SwiftUI", image: "Illustration1", color: Color("background3"), shadowColor: Color("backgroundShadow3"))
]

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
