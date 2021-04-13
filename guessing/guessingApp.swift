//
//  guessingApp.swift
//  guessing
//
//  Created by 張凱翔 on 2021/3/9.
//

import SwiftUI
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //Thread.sleep(forTimeInterval: 1.5)
        return true
    }
}


@main
struct guessingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
