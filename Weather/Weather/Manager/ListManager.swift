//
//  ListManager.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import Foundation
import CoreLocation
import SwiftData

class ListManager {
    
    func getList() async throws -> ListBody {
        
        guard let url = URL(string: "https://dataservice.accuweather.com/currentconditions/v1/topcities/50?apikey=Gv5PNIvuIEuWXibUcGFEr5854YLwfxD1") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ListBody.self, from: data)
        
        return decodedData
    }
}


