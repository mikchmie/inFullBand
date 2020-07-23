//
//  MainController.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 04/11/2019.
//  Copyright © 2019 Mikołaj Chmielewski. All rights reserved.
//

import Foundation
import CoreBluetooth

class MainController: ObservableObject {
    @Published private(set) var logHistory: [LogEntry] = []
    
    private var selectableRowsIndexes: [Int] = []
    private lazy var miBandService = MiBandService(log: { [weak self] logEntry in self?.log(logEntry) },
                                                   specialLog: { [weak self] logEntry in self?.specialLog(logEntry) })
    
    init(logHistory: [LogEntry]) {
        self.logHistory = logHistory
    }
    
    private func log(_ entry: LogEntry) {
        logHistory.append(entry)
    }

    private func specialLog(_ entry: LogEntry) {
        selectableRowsIndexes.append(self.logHistory.count)
        log(entry)
    }

    func discoverButtonAction() {
        miBandService.discoverPeripherals()
    }

    func disconnectButtonAction() {
        miBandService.disconnect()
    }

    func updateButtonAction() {
        miBandService.updateStats()
    }

    func startMonitoringHeartRateButtonAction() {
        miBandService.startMonitoringHeartRate()
    }

    func stopMonitoringHeartRateButtonAction() {
        miBandService.stopMonitorigHeartRate()
    }

    func measureHeartRateButtonAction() {
        miBandService.measureHeartRate()
    }

    func callNotificationButtonAction() {
        miBandService.setHighAlert()
    }

    func textNotificationButtonAction() {
        miBandService.setMildAlert()
    }

    func clearNotificationButtonAction() {
        miBandService.unsetAlert()
    }
    
    func logEntrySelectedAction(logEntry: LogEntry) {
        guard let logEntryIndex = logHistory.firstIndex(of: logEntry),
            let peripheralIndex = selectableRowsIndexes.firstIndex(of: logEntryIndex) else {
                return
        }
        miBandService.connectToPeripheral(at: peripheralIndex)
    }
}
