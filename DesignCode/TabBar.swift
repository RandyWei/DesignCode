//
//  TabBar.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image("IconHome")
                    Text("HOME")
            }
            ContentView()
                .tabItem {
                    Image("IconCards")
                    Text("Certificates")
            }
            Settings()
                .tabItem {
                    Image("IconSettings")
                    Text("Updates")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
