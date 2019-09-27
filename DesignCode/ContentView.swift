//
//  ContentView.swift
//  DesignCode
//
//  Created by Wei on 2019/9/26.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            BlurView(style: .systemMaterial)
            
            TitleView()
//                .blur(radius: show ? 20 : 0)
                .animation(.default)

            CardBottomView()
//                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            BackCardView()
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees:show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeInOut(duration: 0.7))
            .offset(x: viewState.width, y:viewState.height)
            
            BackCardView()
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees:show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeInOut(duration: 0.5))
            .offset(x: viewState.width, y:viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y:viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees:show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
                }.gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded{ value in
                        self.viewState = CGSize.zero
                        self.show = false
                    }
                )
        }
    }
}

struct TitleView:View {
    var body: some View {
        VStack() {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottomView:View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .background(Color.gray)
                .opacity(0.1)
                .cornerRadius(3)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemThickMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}

struct CertificateView: View {
    var certificate: Certificate = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text(certificate.title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color("primary"))
                        .padding(.top)
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }.padding(.horizontal)
            Spacer()
            Image(certificate.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(certificate.width), height: CGFloat(certificate.height))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct BackCardView:View {
    var body: some View {
        VStack{
            Text("Card Back")
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.green)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
