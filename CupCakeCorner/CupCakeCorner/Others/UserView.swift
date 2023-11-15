//
//  UserView.swift
//  CupCakeCorner
//
//  Created by Ancel Dev account on 14/11/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Button("Encode Taylor") {
            encodeTaylor()
        }

    }
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    UserView()
}
