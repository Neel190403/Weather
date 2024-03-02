//
//  ContentView.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import SwiftUI
import SwiftData

let modeKey = "selectedMode"

enum Mode: Int {
    case dark
    case light
}

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    var listManager = ListManager()
    @State var list: ListBody?
    //@State var path = NavigationPath()
    @State private var searchText = ""
    //@State private var isListScreenView = true
    //@State var prevPinnedCities : [UserPinnedCities]
    
    
    struct ThemeView: View {
        
        @State private var selectedMode: Mode = .light
        var body: some View {
            VStack(alignment: .trailing){
                VStack{
                    Button(action: {
                        self.selectedMode = self.selectedMode == .dark ? .light : .dark
                        
                        UserDefaults.standard.set(self.selectedMode.rawValue, forKey: modeKey)
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(selectedMode == .dark ? .white : .black)
                            .padding(.init(top: 10, leading: 300, bottom: 0, trailing: 0))
                    }
                    .padding(.trailing)
                }
                .preferredColorScheme(selectedMode == .dark ? .dark : .light)
                .onAppear {
                    if let storedMode = UserDefaults.standard.value(forKey: modeKey) as? Int,
                       let mode = Mode(rawValue: storedMode) {
                        self.selectedMode = mode
                    }
                }
                .onDisappear(perform: {
                    
                })
            }
        }
    }
    
    var body: some View {
        
        //if isListScreenView == true {ThemeView()}
        
        NavigationStack {
            VStack {
                if let list = list {
                    ListView(list: list, visibleCitiesCount: 3)
                        .navigationBarTitleDisplayMode(.large)
                        .navigationTitle("Weather")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarBackButtonHidden(true)
                        .transition(.move(edge: .leading))
                        .navigationDestination(for: ListElement.self) { city in
                            ContentView1(city: city)
                         }
                        .searchable(text: $searchText)
                } else {
                    LoadingView()
                }
            }
            .task {
                do {
                    list = try await listManager.getList()
                } catch {
                    print("Error getting weather: \(error)")
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
