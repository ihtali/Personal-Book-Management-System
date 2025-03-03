//
//  FeatureScreen2.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 02/03/2025.
//
import SwiftUI

struct FeatureScreen2: View {
    var body: some View {
        ZStack {
            Image("Rem")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Set Reminders")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                Spacer()
                
                Text("  You can set reminders to help you stay on track")
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5)) 
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .shadow(radius: 2)
                
                Spacer()
                
                NavigationLink(destination: FeatureScreen3()) {
                    Text("Next")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 1)
                }
            }
        }
    }
}

#Preview{
    FeatureScreen2()
}
