//
//  MainView.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 01/11/2019.
//  Copyright © 2019 Mikołaj Chmielewski. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var controller: MainController
    
    init(logHistory: [LogEntry] = []) {
        self.controller = MainController(logHistory: logHistory)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                list
                controlPad
            }
            .navigationBarTitle(Text("Activity"))
        }
    }
    
    private var list: some View {
        ScrollViewReader { scrollViewProxy in
            List(controller.logHistory) { logEntry in
                if logEntry.isSpecial {
                    Button(action: {
                        controller.logEntrySelectedAction(logEntry: logEntry)
                    }) {
                        LogListCell(logEntry: logEntry)
                    }
                } else {
                    LogListCell(logEntry: logEntry)
                }
            }
            .listStyle(PlainListStyle())
            .onChange(of: controller.logHistory) { _ in
                if let lastRowID = controller.logHistory.last?.id {
                    withAnimation {
                        scrollViewProxy.scrollTo(lastRowID)
                    }
                }
            }
        }
    }
    
    private var controlPad: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 6.0) {
                ForEach(buttonDescriptors, id: \.self) { sectionItems in
                    HStack(spacing: 6.0) {
                        ForEach(sectionItems, id: \.self) { item in
                            Button(action: item.action) {
                                ActionButtonView(emoji: item.emoji, title: item.title)
                            }
                        }
                    }
                }
            }
            .padding(6.0)
            .background(Color.black.edgesIgnoringSafeArea(.bottom))
        }
    }
    
    private var buttonDescriptors: [[ButtonDescriptor]] {
        [[ButtonDescriptor(emoji: "🌎", title: "Discover", action: controller.discoverButtonAction),
          ButtonDescriptor(emoji: "❌", title: "Disconnect", action: controller.disconnectButtonAction),
          ButtonDescriptor(emoji: "📶", title: "Update stats", action: controller.updateButtonAction)],
         [ButtonDescriptor(emoji: "💚", title: "On", action: controller.startMonitoringHeartRateButtonAction),
          ButtonDescriptor(emoji: "❤️", title: "Off", action: controller.stopMonitoringHeartRateButtonAction),
          ButtonDescriptor(emoji: "💛", title: "Measure", action: controller.measureHeartRateButtonAction)],
         [ButtonDescriptor(emoji: "📱", title: "Alert", action: controller.callNotificationButtonAction),
          ButtonDescriptor(emoji: "✉️", title: "Alert", action: controller.textNotificationButtonAction),
          ButtonDescriptor(emoji: "❕", title: "Clear alert", action: controller.clearNotificationButtonAction)]]
    }
}

fileprivate struct ButtonDescriptor: Hashable {
    let emoji: String
    let title: String
    let action: () -> Void
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(emoji)
        hasher.combine(title)
    }
    
    static func == (lhs: ButtonDescriptor, rhs: ButtonDescriptor) -> Bool {
        return lhs.emoji == rhs.emoji && lhs.title == rhs.title
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(logHistory: [
            LogEntry(emoji: "🌎", title: "Discovered", subtitle: "Mi Band 2", isSpecial: true),
            LogEntry(emoji: "❌", title: "Title", subtitle: "Subtitle"),
            LogEntry(emoji: "🔥", title: "No subtitle", subtitle: "")
        ])
    }
}
