//
//  Home.swift
//  DesignCode
//
//  Created by Wei on 2019/9/26.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    
    
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList()
//                .blur(radius: show ? 20 : 0)
                .scaleEffect( showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
            .cornerRadius(30)
            .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 70 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
            
            MenuRightButtons(show: $showProfile)
            
            MenuView(show: $show)
            
        }
    }
}

struct MenuRightButtons:View {
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton(icon: "bell")
                }
            }
            //为了把ZStack撑大
            Spacer()
        }
    }
}

struct MenuButton:View {
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                self.show.toggle()
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                    .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                .offset(x: -25)
            }
            //为了把ZStack撑大
            Spacer()
        }
    }
}

struct CircleButton:View {
    var icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(BlurView(style: .systemUltraThinMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuView:View {
    var menu = menuData
    @Binding var show: Bool
    var body:some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                 MenuRow(menu: item)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .padding(.trailing, 60)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .animation(.spring())
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct MenuRow:View {
    var menu: Menu
    var body: some View {
        HStack {
            Image(systemName: menu.icon)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 30, height: 30)
                
            Text(menu.title)
                .font(.headline)
            
            Spacer()
        }
    }
}

struct Menu:Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
