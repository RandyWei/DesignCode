//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Wei on 2019/9/27.
//  Copyright © 2019 Wei. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = []
}
