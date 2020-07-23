//
//  LogEntry.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 08.01.2018.
//  Copyright © 2018 inFullMobile. All rights reserved.
//

import Foundation

struct LogEntry: Hashable, Identifiable {
    let id: UUID
    let emoji: String
    let title: String
    let subtitle: String
    let isSpecial: Bool
    
    init(emoji: String, title: String, subtitle: String, isSpecial: Bool = false) {
        self.id = UUID()
        self.emoji = emoji
        self.title = title
        self.subtitle = subtitle
        self.isSpecial = isSpecial
    }
}
