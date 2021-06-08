//
//  Register.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 28/05/2021.
//

import SwiftUI
import Firebase

struct userRegister {
    var user: String = ""
    var email: String = ""
    var password: String = ""
    
    var data = [String : Any]()
    
    mutating func updateValues(inputUser: String,
                               inputEmail: String,
                               inputPass: String,
                               inputObjetive: [String : String]) {
        
        data = ["name": inputUser,
                "email": inputEmail,
                "profileImageUrl": "",
                "values": inputObjetive] as [String : Any]
        password = inputPass
    }
    
    mutating func updateImageUrl(urlImage: String) {
        self.data["profileImageUrl"] = urlImage
    }
}

struct Register: View {
    @State private var user: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var opac: Double = 1.0
    
    @State private var targetAdecuado: String = ""
    @State private var targetDestacado: String = ""
    @State private var targetSobresal: String = ""
    
    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false

    @State var uiImage: UIImage? = nil

    var sheet: ActionSheet {
        ActionSheet(
            title: Text("Action"),
            message: Text("Quotemark"),
            buttons: [
                .default(Text("Change"), action: {
                    self.showAction = false
                    self.showImagePicker = true
                }),
                .cancel(Text("Close"), action: {
                    self.showAction = false
                }),
                .destructive(Text("Remove"), action: {
                    self.showAction = false
                    self.uiImage = nil
                })
            ])

    }
    
    @ObservedObject var signed: Signed_Auth
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Create my account")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .font(.system(size: 30))
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: heightScreem() / 4,
                    alignment: .bottom
                )
                VStack {
                    if (uiImage == nil) {
                        Image(systemName: "camera.on.rectangle")
                            .accentColor(Color.purple)
                            .onTapGesture {
                                self.showImagePicker = true
                            }
                            .background(Color.gray
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(65))
                            .frame(width: 130, height: 130)
                            .padding()
                    } else {
                        Image(uiImage: uiImage!)
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(65)
                            .onTapGesture {
                                self.showAction = true
                            }
                            .frame(width: 130, height: 130)
                            .padding()
                    }
                }.sheet(isPresented: $showImagePicker, onDismiss: {
                    self.showImagePicker = false
                }, content: {
                    ImagePicker(isShown: self.$showImagePicker, uiImage: self.$uiImage)
                })

                .actionSheet(isPresented: $showAction) {
                    sheet
                }
                
                
                
                VStack(alignment: .leading){
                    Text("Username:")
                        .foregroundColor(.white)
                    ZStack(alignment: .bottom) {
                        TextField("", text: $user)
                            .textFieldStyle(PlaceholderTextFieldStyle("Input username", text: $user))
                            .frame(width: 300, height: 35)
                            .onTapGesture {
                                signed.fail = false
                            }
                    }.padding(.bottom, 15)
                    
                    Text("Email:")
                        .foregroundColor(.white)
                    ZStack(alignment: .bottom) {
                        TextField("", text: $email)
                            .textFieldStyle(PlaceholderTextFieldStyle("Input email", text: $email))
                            .frame(width: 300, height: 35)
                            .onTapGesture {
                                signed.fail = false
                            }
                    }.padding(.bottom, 15)
                    
                    Text("Password:")
                        .foregroundColor(.white)
                    ZStack(alignment: .bottom) {
                        SecureField("", text: $password)
                            .textFieldStyle(PlaceholderTextFieldStyle("Input Password", text: $password))
                            .frame(width: 300, height: 35)
                            .onTapGesture {
                                signed.fail = false
                            }
                    }.padding(.bottom, 15)
                    
                }
                
                VStack {
                    Text("Input your targets:")
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    HStack {
                        ZStack(alignment: .bottom) {
                            TextField("", text: $targetAdecuado)
                                .textFieldStyle(PlaceholderTextFieldStyle("Adecuado", text: $targetAdecuado))
                                .keyboardType(.numberPad)
                            rectangleView(colorSelect: "#FFC857")
                        }
                        .frame(width: 110, height: 35, alignment: .center)
                        
                        ZStack(alignment: .bottom) {
                            TextField("", text: $targetDestacado)
                                .textFieldStyle(PlaceholderTextFieldStyle("Destacado", text: $targetDestacado))
                                .keyboardType(.numberPad)
                            rectangleView(colorSelect: "60C291")
                        }
                        .frame(width: 110, height: 35, alignment: .center)
                        
                        ZStack(alignment: .bottom) {
                            TextField("", text: $targetSobresal)
                                .textFieldStyle(PlaceholderTextFieldStyle("Sobresal", text: $targetSobresal))
                                .keyboardType(.numberPad)
                            rectangleView(colorSelect: "#1FD35D")
                        }
                        .frame(width: 110, height: 35, alignment: .center)
                    }
                }
                .padding(.vertical, 15)
                
                Button(action: {
                    let target = [ "Adecuado": targetAdecuado,
                                   "Destacado": targetDestacado,
                                   "Sobresal": targetSobresal]
                    
                    var newUser = userRegister()
                    newUser.updateValues(inputUser: user,
                                         inputEmail: email,
                                         inputPass: password,
                                         inputObjetive: target)
                    
                    signed.Register2(user: newUser, image: uiImage)
                }) {
                    Text("Create account")
                }
                .frame(width: 200, height: 50, alignment: .center)
                .accentColor(.white)
                .background(Color.init(hexStringToUIColor(hex: "60C291")))
                .cornerRadius(25)
                .font(.system(size: 23))
                .padding(.top, 15)
                
            }
            
            if signed.wait {
                AnimationShape()
            } else if signed.created {
                ModalRegister(signed: signed)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        )
        .background(Color.init(hexStringToUIColor(hex: "#1A1C21")))
        .ignoresSafeArea(.all)
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(signed: Signed_Auth())
            .previewDevice("iPhone 12")
    }
}
