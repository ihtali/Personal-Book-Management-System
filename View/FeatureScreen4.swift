//
//  FeatureScreen4.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 02/03/2025.
//
import SwiftUI

struct FeatureScreen4: View {
    var body: some View {
        ZStack {
            Image("cat")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Manage Categories")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                Spacer()
                
                Text(" Create categories to organize your books.")
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5)) 
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .shadow(radius: 2)
                
                Spacer()
                
                NavigationLink(destination: TabNavigation()) {
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

#Preview {
    FeatureScreen4()
}
