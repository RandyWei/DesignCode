//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update
    var body: some View {
        VStack(spacing: 20.0) {
            Text(update.title)
                .bold()
                .font(.title)
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(update.text)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }.padding(20)
    }
}
