//
//  AppDelegate.swift
//  inFullBand
//
//  Created by Mikołaj Chmielewski on 21.11.2017.
//  Copyright © 2017 inFullMobile. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UIHostingController(rootView: MainView())
        window?.makeKeyAndVisible()
        return true
    }
}
