//
//  ContentView.swift
//  dream
//
//  Created by Assia Rguib on 2023-02-19.
//
import Foundation
import SwiftUI
import FirebaseDatabase
import UserNotifications

class readDB: ObservableObject{
    let ref = Database.database().reference()
//

    @Published var values: [Int]=[]
    func readVal(){
        let db = ref.child("cl_value_dist")
        db.observe(.value) { snapshot  in
            if let value = snapshot.value as? Int {
                            self.values = [10-value]
                        } else {
                            print("Invalid data received from Firebase")
                        }
        }
    }
}

struct SecondController: View {
    @ObservedObject var readData = readDB();
    @State var press: Bool=false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        if press {
                VStack{
                    Text(CurrentDate())
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.bottom, 40.0)
                    Rectangle()
                        .trim(from:0.1735,to:1)
                        .stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 3)
                        .frame(width: 170.0, height: 320.0)
                    ZStack {
                        
                        Rectangle()
                            .fill(chloreLevelColor(x: readData.values.first ?? 0))
                            .frame(width: 166.0, height: (CGFloat(readData.values.first ?? 0)*31.5))
                        
                    }.padding(.top,-((CGFloat(readData.values.first ?? 0 )*31.5)+10))
                    
                    Text(String(readData.values.first ?? 0))
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.bottom)
                }
        }
        else{
                VStack{
                    Text("Welcome to Cl+Flow!").font(.title)
                        .fontWeight(.light)
                        .padding(.bottom, 50.0)
                    Button("View Chlorine Level"){readData.readVal();press=true}
                        .padding(10)
                        .foregroundColor(.green)
                        .background(
                            Rectangle()
                                .stroke(Color.green, lineWidth: 2)
                                .cornerRadius(10)
                                
                        )
                }
        }
    }
    }


extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
func CurrentDate()->String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    return("Today \(day)/\(month)/\(year)")
}

func chloreLevelColor(x:Int) -> Color {
    var color = Color.green
    if (x <= 3){
        color = Color.red
        notify()
        }
    return color
}
func notify(){
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        if granted {
                let content = UNMutableNotificationContent()
                content.title = "Chlorine level is down"
                content.body = "The Chlorine level is below the minimum threshold."
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)

                let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
                center.add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                        return
                    }
                }

            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondController()
    }
}


