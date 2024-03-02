//
//  ToolbarDetailsPage.swift
//  Screen1draft
//
//  Created by Neel Pandya on 22/02/24.
//

import SwiftUI
import SafariServices

struct ToolbarDetailsPage: View {
    
    @Binding var isShowingSafariView : Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        HStack{
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.primary)
            }
            .padding(.init(top: 0, leading: 20, bottom: 10, trailing: 0 ))
            .labelStyle(.automatic)
            
            Spacer()
            
            Divider()
                .frame(width: 30, height: 60)
                .foregroundColor(Color(.black))
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.primary)
            }
            .fullScreenCover(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string: "https://openweathermap.org/api")!)
                    .ignoresSafeArea()
            })
            .padding(.init(top: 0, leading: 20, bottom: 10, trailing: 0 ))
            
            Spacer()
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    ToolbarDetailsPage(isShowingSafariView: $isShowingSafariView)
//}


struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ safariViewController: SFSafariViewController, context: Context) {
    }
}


