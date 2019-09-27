//
//  Settings.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle (isOn: $receive){
                    Text("Receive Notifications")
                }
                Stepper(value: $number, in: 1 ... 10){
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite")){
                    Text("SwiftUI").tag(1)
                    Text("Reat").tag(2)
                }
                DatePicker(selection: $date) {
                    Text("Date")
                }
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                }
                Button(action:{ self.submit.toggle() }){
                    Text("Submit")
                }.alert(isPresented: $submit) {
                    Alert(title: Text("Thanks"), message: Text("Email:\(email)"))
                }
            }.navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
