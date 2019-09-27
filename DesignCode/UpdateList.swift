//
//  UpdateList.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @State var showSettingModel = false
    
    @ObservedObject var updateStore: UpdateStore = UpdateStore()
    
    var settingButton : some View {
        Button(action:{ self.showSettingModel.toggle() }) {
            Image(systemName: "gear")
        }
    }
    
    func move(from source:IndexSet, to destination: Int){
        self.updateStore.updates.swapAt(source.first!, destination)
    }
    
    var body: some View {
        NavigationView {
            
            List {
                
                Button(action:{
                    self.updateStore.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
                }){
                    Text("Add Update")
                }
                
                ForEach(self.updateStore.updates){item in
                    NavigationLink(destination: UpdateDetail(update: item)) {
                        HStack(spacing: 12.0) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color("backgound"))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .frame(height: 50)
                                Text(item.date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding(.vertical, 8.0)
                }.onDelete { index in
                    self.updateStore.updates.remove(at: index.first!)
                }.onMove(perform: move)
            }
            .navigationBarTitle("Updates")
            .navigationBarItems(trailing: EditButton())
            .sheet(isPresented: $showSettingModel){
                Text("Settings")
            }
            .onAppear{
                self.updateStore.updates = updateData
            }
        }
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Take your static design to the next level and build real apps with the simplicity of a prototpying tool. The best way to beginners to learn code, and the most efficient way for developers to learn design.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Framer makes it incredibly easy to add complex user interactions inside your prototype, taking your design and code components to the next level. Playground allows you to quickly test new concepts within the all - new in -app code editor. You can combine your current app flow with new code components created in Playground.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19")
]

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
