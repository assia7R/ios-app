////
////  First Controller.swift
////  Cl+Flow
////
////  Created by Meriem Rguib on 2023-03-21.
////
//
//import Foundation
//import SwiftUI
//import FirebaseDatabase
//import UserNotifications
//
//struct FirstControllerm: View {
//    //    @Binding var GoToPage2: Bool
//    @ObservedObject var readData = readDB();
//    @State var pressed = false
//    var body: some View {
//        NavigationView {
//            VStack{
//                Text("Welcome to Cl+Flow!").font(.title)
//                    .fontWeight(.light)
//                    .padding(.bottom, 50.0)
//                Button("view"){
//                    pressed = true
//                }.sheet(isPresented: $pressed, content: SecondController)
//                
//            }
//        }
//    }
//}
