//
//  Cl_FlowApp.swift
//  Cl+Flow
//
//  Created by Assia Rguib on 2023-03-06.
//

import UIKit
import SwiftUI
import FirebaseCore
@main
struct Cl_FlowApp: App {
    init() {
            FirebaseApp.configure()
        }
        var body: some Scene {
            WindowGroup {
                SecondController()
            }
        }
    }
