//
//  LogListCell.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 01/11/2019.
//  Copyright © 2019 Mikołaj Chmielewski. All rights reserved.
//

import SwiftUI

struct LogListCell: View {
    let logEntry: LogEntry
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Text(logEntry.emoji)
            VStack(alignment: .leading, spacing: 4) {
                Text(logEntry.title)
                    .foregroundColor(.primary)
                    .font(.system(size: 16.0))
                if !logEntry.subtitle.isEmpty {
                    Text(logEntry.subtitle)
                        .foregroundColor(.secondary)
                        .font(.system(size: 14.0))
                }
            }
            .frame(height: 40.0)
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LogListCell(logEntry: LogEntry(emoji: "🌎", title: "Title", subtitle: "Subtitle"))
    LogListCell(logEntry: LogEntry(emoji: "🔥", title: "Title", subtitle: ""))
}
