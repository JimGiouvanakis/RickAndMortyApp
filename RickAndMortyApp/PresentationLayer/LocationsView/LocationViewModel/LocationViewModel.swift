//
//  LocationViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

@MainActor
class LocationViewModel: ObservableObject {
    
    let useCase = UseCase()
    
    private var imageURL: String = "https://rickandmortyapi.com/api/character/avatar/"
    private var imageURLEnding: String =  ".jpeg"
    
    @Published var locations: [LocationItem] = []
    @Published var locationInfo: Info = Info(count: 0, pages: 0, next: "", prev: "")
    
    func setup() async {
        await getData(url: Constants.mainAPILink)
    }
    
    private func getData(url: String) async {
        let urls = await useCase.execute()
        
        await getLocationData(url: urls.locations)
        
    }
    
    func getNewData(url: String) {
        Task { await self.getLocationData(url: url) }
    }
    
    func getLocationData(url: String) async {
        
        let locations = await useCase.executeLocationData(url: url)
        
        guard let results = locations.results else { return }
        
        self.locations = results
        
        guard let info = locations.info else { return }
        
        self.locationInfo = info
    }
    
    func getLocationResidents(residents: [String]) -> [String] {
        var locationResidents: [String] = []
        
        for resident in residents {
        let residentSplitURL = resident.components(separatedBy: "/")
        let newString = residentSplitURL[5]
        let locationResident = imageURL + newString + imageURLEnding
            locationResidents.append(locationResident)
        }
        return locationResidents
    }
    
    
}
