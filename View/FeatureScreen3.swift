//
//  FeatureScreen3.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 02/03/2025.
//
import SwiftUI

struct FeatureScreen3: View {
    var body: some View {
        ZStack {
            Image("rrr") 
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
            
                Text("Track Your Progress")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.1))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                Spacer()
                
                Text("Monitor your reading progress with detailed statistics and track how many pages you've read and how many are left.")
                
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.1))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .shadow(radius: 2)
                
                Spacer()
                
                NavigationLink(destination: FeatureScreen4()) {
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
    FeatureScreen3()
}
