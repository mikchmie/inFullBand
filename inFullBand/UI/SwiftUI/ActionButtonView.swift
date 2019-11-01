//
//  ActionButtonView.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 01/11/2019.
//  Copyright © 2019 Mikołaj Chmielewski. All rights reserved.
//

import SwiftUI

struct ActionButtonView: View {
    let emoji: String
    let title: String
    
    var body: some View {
        Group {
            HStack {
                Spacer()
                VStack(spacing: 4.0) {
                    Text(emoji)
                        .font(.system(size: 20.0))
                    Text(title.uppercased())
                        .font(.system(size: 10.0, weight: .bold))
                        .foregroundColor(Color(white: 220.0 / 255.0, opacity: 1.0))
                }
                Spacer()
            }
            .padding(6.0)
        }
        .background(Color(white: 68.0 / 255.0, opacity: 1.0))
        .cornerRadius(4.0)
    }
}

struct SUActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(emoji: "🌎", title: "Discover")
            .previewLayout(.fixed(width: 100, height: 70))
    }
}
