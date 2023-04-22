//
//  FirstController.swift
//  Cl+Flow
//
//  Created by Meriem Rguib on 2023-03-21.
//

import Foundation
import UIKit
import SwiftUI

//class FirstController: UIViewController{
//    @IBOutlet weak var view_btn : UIButton!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view_btn.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
//    }
//    @objc func tapOnButton(){
////        let story = UIStoryboard(name: "Main",bundle:nil)
//        let secondController = SecondController()
//        let hostingController = UIHostingController(rootView: secondController)
//        self.present(hostingController, animated: true, completion: nil)
//
//    }
//}

struct FirstController: View {
    @Binding var GoToPage2: Bool
    var body: some View {
        VStack{
            Text("Welcome to Cl+Flow!").font(.title)
                .fontWeight(.light)
                .padding(.bottom, 50.0)
            Button("View Chlorine Level") {
                GoToPage2 = true
            }
            NavigationLink(destination: SecondController()) {
            }
        }
    }
}

