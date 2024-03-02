//
//  ListView.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Environment(\.modelContext) var context
    @State private var path = NavigationPath()
    @State var list: [ListElement] = []
    @State private var searchStr = ""
    @State var visibleCitiesCount: Int = 3
    @State private var pinnedCities: [ListElement] =  []
    //@Binding var colorScheme: ColorScheme
    
    
    // swift data model
    @State var userPinnedCities : [UserPinnedCities] = []
    
    var filteredList: [ListElement] {
        guard !searchStr.isEmpty else { return list }
        return list.filter { $0.englishName.localizedCaseInsensitiveContains(searchStr) }
    }
    
    func fetchPinnedCitiesFromDB() {
        
        let fetchDescriptor = FetchDescriptor<UserPinnedCities>()
        do {
            let userPinnedCities = try context.fetch(fetchDescriptor)
            for city in userPinnedCities {
                if let matchingCity = list.first(where: { $0.key == city.key }) {
                    print("Previously pinned citie:  \(city.cityName)")
                    // add to pinned city
                    pinnedCities.append(matchingCity)
                    
                    // remove from main list
                    list.removeAll(where: { $0.id == matchingCity.id })
                }
            }
        } catch {
            print("Failed to load Movie model.")
        }
    }
    

    var body: some View {
        ScrollViewReader{ scrollView in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    if !pinnedCities.isEmpty && searchStr=="" /*&& !prevPinnedCities.isEmpty */{
                        VStack(alignment: .leading){
                            HStack{
                                Spacer().frame(width: 20)
                                Image(systemName: "pin.circle")
                                    .resizable()
                                    
                                    .frame(width: 20, height: 20)
                                Text("Pinned Cities")
                                    .font(.headline)
                                Spacer()
                            }
                        }
                        
                        ForEach(pinnedCities) { city in
                            NavigationLink(destination: ContentView1(city: city)) {
                                CityView(city: city)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .contextMenu(ContextMenu(menuItems: {
                                Button {
                                    unpinCity(city: city)
                                } label: {
                                    Label("Unpin", systemImage: "pin.slash")
                                }
                            }))
                        }
                        Divider()
                            .padding()
                    }
                    
                    ForEach(filteredList.prefix(visibleCitiesCount), id: \.id) { city in
                        NavigationLink(destination: ContentView1(city: city)) {
                            CityView(city: city)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contextMenu(ContextMenu(menuItems: {
                            Button {
                                pinCity(city: city)
                            } label: {
                                Label("Pin to top", systemImage: "pin.circle")
                            }
                        }))
                    }
                    if (visibleCitiesCount < list.count && searchStr==""){
                        withAnimation{
                            Button("Load More") {
                                loadMoreCities()
                            }
                            .padding()
                            .disabled(visibleCitiesCount >= list.count)
                        }
                    }
                    Spacer()
                }
                .searchable(text: $searchStr, placement: .automatic, prompt: "Search a city")
                .onAppear {
                    scrollView.scrollTo(list[list.endIndex - 1])
                    self.fetchPinnedCitiesFromDB()
                }
            }
        }.navigationBarBackButtonHidden()
    }
    
    func loadMoreCities() {
        visibleCitiesCount = min(visibleCitiesCount + 3, list.count)
    }
    
    func pinCity(city: ListElement) {
        pinnedCities.append(city)
        if let index = list.firstIndex(of: city) {
            list.remove(at: index)
        }
        let pinnedCity  = UserPinnedCities(key: city.key, cityName: city.englishName)
        userPinnedCities.append(pinnedCity)

        context.insert(pinnedCity)
        try? context.save()
    }
    
    func unpinCity(city: ListElement) {
        let pinnedCityToDelete = userPinnedCities.filter({  $0.key == city.key  }).first
        if let cityToDelete = pinnedCityToDelete {
            context.delete(cityToDelete)
        }
        pinnedCities.removeAll(where: { $0.id == city.id })
        list.append(city)
    }
}
