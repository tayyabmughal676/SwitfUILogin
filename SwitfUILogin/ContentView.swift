//
//  ContentView.swift
//  SwitfUILogin
//
//  Created by Thor on 22/06/2021.
//

import SwiftUI

var lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Thor"
let storedPassword = "asdfgh"

struct ContentView: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                textView()
                UserImage()
                UserNameTextFiled(username: $username)
                UserPasswordSecureTextfield(password: $password)
                if authenticationDidFail{
                    Text("Information not correct, try again!")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(
                    action: {
                        if self.username == storedUsername && self.password == storedPassword{
                            self.authenticationDidSucceed = true
                            self.authenticationDidFail = false
                        }else{
                            self.authenticationDidFail = true
                            self.authenticationDidSucceed =  false
                        }
                    }, label: {
                        LoginBtn()
                    }
                )
            }
            .padding()
            
            if authenticationDidSucceed  {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 70)
                    .background(Color.yellow)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct textView: View {
    var body: some View {
        Text("Hello I'm!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20 )
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginBtn: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width:220, height: 60)
            .background(Color.black)
            .cornerRadius(35)
    }
}

struct UserNameTextFiled: View {
    
    @Binding var username : String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct UserPasswordSecureTextfield: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
