//
//  SwiftUIView.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 27/05/2021.
//

import SwiftUI
import Firebase

class Signed_Auth: ObservableObject {
    @Published var signed: Bool = false
    @Published var wait: Bool = false
    @Published var fail: Bool = false
    @Published var created: Bool = false
    @Published var error: String = ""
    
    func LogOut() {
        try? Auth.auth().signOut()
    }
    
    func login(user: String, password: String) {
        self.wait = true

        Auth.auth().signIn(withEmail: user, password: password) { (result, error) in
            if error != nil {
                self.wait = false
                self.fail = true
                print(error?.localizedDescription ?? "")
            } else {
                self.signed = true
                self.wait = false
                print("Sing in Success")
            }
        }
    }
    
    func Register(email: String, password: String) {
        self.wait = true
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.wait = false
                self.fail = true
                self.created = true
                self.error = error?.localizedDescription ?? ""
                print(error?.localizedDescription ?? "")
            } else {
                self.wait = false
                self.fail = false
                self.created = true
                print(authResult?.description ?? "")
                print(authResult?.user.uid ?? "")
                
                let userID = authResult?.user.uid
                var ref: DatabaseReference!
                ref = Database.database().reference()
                
                ref.child("users").child(userID!).setValue(["username": email])
            }
        }
    }
    
    func Register2(user: userRegister, image: UIImage?) {
        var userUpload: userRegister = user
        self.wait = true
        
        Auth.auth().createUser(withEmail: user.data["email"] as! String,
                               password: user.password,
                               completion: { (authResult, error) in
            if error != nil {
                self.wait = false
                self.fail = true
                self.created = true
                self.error = error?.localizedDescription ?? ""
                print(error?.localizedDescription ?? "")
            } else {
                self.wait = false
                self.fail = false
                self.created = true
                
                let userID = authResult?.user.uid
                var ref: DatabaseReference!
                
                let imageUID = NSUUID().uuidString
                
                let refStorage = Storage.storage().reference()
                let storageRef = refStorage.child("users").child(userID!).child("Image Profile").child("\(imageUID).png")
                
                ref = Database.database().reference()
                
                if let uploadData = image!.pngData() {
                    storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                        if error != nil {
                            self.error = error?.localizedDescription ?? ""
                            print(error?.localizedDescription ?? "")
                        }
                        storageRef.downloadURL { (url, error) in
                            if error != nil {
                                self.error = error?.localizedDescription ?? ""
                                print(error?.localizedDescription ?? "")
                            }
                            if let profileImageUrl = url?.absoluteString {
                                userUpload.updateImageUrl(urlImage: profileImageUrl)
                                ref.child("users").child(userID!).setValue(userUpload.data)
                            }
                        }
                    }
                }
                
            }
        })
    }
    
    func resetCreated() {
        self.created = false
    }
}
