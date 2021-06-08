//
//  SettingsView.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 24/05/2021.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @State private var targetDetract: String = ""
    @State private var targetNeutro: String = ""
    @State private var targetPromotor: String = ""
    
    @State private var nameUser: String = ""
    @State private var emailUser: String = ""
    
    func obtainData() {
        let userID = Auth.auth().currentUser?.uid
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let nameUser = value!["name"] as? String
            let email = value!["email"] as? String
//            let username = value?["name"] as? String ?? ""
//            let user = User(username: username)
            // ...
            self.emailUser = email!
            self.nameUser = nameUser!
            
            }) { (error) in
              print(error.localizedDescription)
          }
        
//        print(ref ?? "")
        print(userID ?? "")
    }
    
    var body: some View {
        ZStack {
            Color.init(hexStringToUIColor(hex: "#1A1C21"))
            VStack {
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipped()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                Text(nameUser.isEmpty ? "" : nameUser)
                    .padding(.top)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(emailUser.isEmpty ? "" : emailUser)
                    .padding(.bottom, 30)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .opacity(0.4)
                
                Text("Target NPS:")
                    .foregroundColor(.gray)
                HStack {
                    ZStack(alignment: .bottom) {
                        TextField("", text: $targetDetract)
                            .textFieldStyle(PlaceholderTextFieldStyle("Adecuado", text: $targetDetract))
                            .keyboardType(.numberPad)
                        rectangleView(colorSelect: "#EB695B")
                    }
                    .frame(width: 110, height: 70, alignment: .center)
                    
                    ZStack(alignment: .bottom) {
                        TextField("", text: $targetNeutro)
                            .textFieldStyle(PlaceholderTextFieldStyle("Destacado", text: $targetNeutro))
                            .keyboardType(.numberPad)
                        rectangleView(colorSelect: "#FFC857")
                    }
                    .frame(width: 110, height: 70, alignment: .center)
                    
                    ZStack(alignment: .bottom) {
                        TextField("", text: $targetPromotor)
                            .textFieldStyle(PlaceholderTextFieldStyle("Sobresal", text: $targetPromotor))
                            .keyboardType(.numberPad)
                        rectangleView(colorSelect: "#1FD35D")
                    }
                    .frame(width: 110, height: 70, alignment: .center)
                }
                
                Button(action: {
                    // Aca va una funcion
                }) {
                    Text("Saved")
                }
                .frame(width: 200, height: 50, alignment: .center)
                .accentColor(.white)
                .background(Color.init(hexStringToUIColor(hex: "60C291")))
                .cornerRadius(25)
                .font(.system(size: 23))
                .padding(.top, 15)
            }
        }
        .ignoresSafeArea()
        .onAppear{
//            obtainData()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
