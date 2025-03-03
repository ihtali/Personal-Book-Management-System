//
//  WelcomeScreen.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 02/03/2025.
//
import SwiftUI


struct WelcomeScreen: View {
    @State private var goToFeatures = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wel")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Welcome to Your Library!")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.5))
                        .shadow(radius: 5)
                        .padding()
                    Spacer()
                    
                    Text("Get Started with exploring the features of the app.")
                    
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.5)) 
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .shadow(radius: 2)
                    
                    Spacer()
                    
                    NavigationLink(destination: FeatureScreen1()) {
                        Text("Get Started")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .bold()
                            .cornerRadius(10)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 1)
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
