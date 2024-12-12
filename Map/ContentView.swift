//
//  ContentView.swift
//  Map
//
//  Created by Red Whale inc. on 03/12/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var camera: MapCameraPosition = .automatic
    @State var locationButtonColor: Bool = false
    @State var artButtonColor: Bool = false
    @State var libraryButtonColor: Bool = false
    @State var busButtonColor: Bool = false
    
    let iLocation = CLLocationCoordinate2D(latitude: 43.627800, longitude: -79.630613)
    let tLibrary = CLLocationCoordinate2D(latitude: 43.639217, longitude: -79.400414)
    let busStation = CLLocationCoordinate2D(latitude: 43.616302, longitude: -79.702146)
    let artGallery = CLLocationCoordinate2D(latitude: 43.5889083, longitude: -79.6438778)
    
    var body: some View {
        Map(position: $camera){
            Annotation("My Location", coordinate: iLocation){
                Image(systemName: "livephoto")
                    .foregroundColor(.blue)
                    .scaleEffect(1.5)
                    .symbolEffect(.variableColor.cumulative.dimInactiveLayers.reversing, options: .repeat(.continuous))
            }
            
            Marker("Toronto Public Library", systemImage: "building.columns.circle.fill", coordinate: tLibrary)
                .tint(.blue)
            
            Annotation("Bus Station", coordinate: busStation) {
                Image(systemName: "bus")
                    .foregroundColor(.blue)
                    .scaleEffect(1.5)
            }
            
            Annotation("Art Gallery", coordinate: artGallery){
                Image(systemName: "person.crop.artframe")
                    .foregroundColor(.red)
                    .scaleEffect(1.5)
                    
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button{
                    camera = .region(MKCoordinateRegion(center: iLocation, latitudinalMeters: 200, longitudinalMeters: 200))
                    locationButtonColor.toggle()
                } label: {
                    VStack(spacing: 7){
                        Image(systemName: "person.fill")
                            .scaleEffect(1.5)
                        Text("Location")
                            .font(.system(size: 13, weight: .semibold, design: .default))
                    }
                    .foregroundColor(locationButtonColor ? Color.blue : Color.gray)
                    .frame(width: 80, height: 80)
                    .contentTransition(.symbolEffect(.replace))
                    .cornerRadius(5)
                }
                
                Button{
                    camera = .region(MKCoordinateRegion(center: artGallery, latitudinalMeters: 200, longitudinalMeters: 200))
                    artButtonColor.toggle()
                } label: {
                    VStack(spacing: 7){
                        Image(systemName: "person.crop.artframe")
                            .scaleEffect(1.5)
                        Text("Gallery")
                            .font(.system(size: 13, weight: .semibold, design: .default))
                    }
                    .foregroundColor(artButtonColor ? Color.blue : Color.gray)
                    .frame(width: 80, height: 80)
                    .contentTransition(.symbolEffect(.replace))
                    .cornerRadius(5)
                }
                
                Button{
                    camera = .region(MKCoordinateRegion(center: tLibrary, latitudinalMeters: 200, longitudinalMeters: 200))
                    libraryButtonColor.toggle()
                } label: {
                    VStack(spacing: 7){
                        Image(systemName: "building.columns.fill")
                            .scaleEffect(1.5)
                        Text("Library")
                            .font(.system(size: 13, weight: .semibold, design: .default))
                    }
                    .foregroundColor(libraryButtonColor ? Color.blue : Color.gray)
                    .frame(width: 80, height: 80)
                    .contentTransition(.symbolEffect(.replace))
                    .cornerRadius(5)
                }
                
                Button{
                    camera = .region(MKCoordinateRegion(center: busStation, latitudinalMeters: 200, longitudinalMeters: 200))
                    busButtonColor.toggle()
                } label: {
                    VStack(spacing: 7){
                        Image(systemName: "bus")
                            .scaleEffect(1.5)
                        Text("Bus Station")
                            .font(.system(size: 13, weight: .semibold, design: .default))
                    }
                    .foregroundColor(busButtonColor ? Color.blue : Color.gray)
                    .frame(width: 80, height: 80)
                    .contentTransition(.symbolEffect(.replace))
                    .cornerRadius(5)
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
        }
    }
}

#Preview {
    ContentView()
}
