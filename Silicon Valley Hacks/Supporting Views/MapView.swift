//
//  MapView.swift
//  Silicon Valley Hacks
//
//  Created by Arjun Sharma on 22/04/20.
//  Copyright © 2020 Arjun Sharma. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        for annotation in annotations {
            //annotation.title = "Annnotation"
           // annotation.subtitle = "Subtitle"
            //annotation.coordinate = CLLocationCoordinate2D(latitude: 37.78735889999999, longitude: -122.40822700000001)
            mapView.addAnnotation(annotation)
        }
        
        return mapView

       
    }
 
     func updateUIView(_ view: MKMapView, context: Context) {
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
   }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView){
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // Don't want to show a custom image if the annotation is the user's location.
            guard !(annotation is MKUserLocation) else {
                return nil
            }
            // Better to make this class property
            let annotationIdentifier = "AnnotationIdentifier"
            var annotationView: MKAnnotationView?
            if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
                annotationView = dequeuedAnnotationView
                annotationView?.annotation = annotation
            }
            else {
                let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                annotationView = av
            }

            if let annotationView = annotationView {
                // Configure your annotation view here
                annotationView.canShowCallout = true
                annotationView.image = UIImage(systemName: "person.circle.fill")
                annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)
            }
            

            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if let annotationTitle = view.annotation?.title {
                print("User tapped annotation with title \(annotationTitle ?? "Error - no titel")")
            }
        }
    }
    
    
}




//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
//    }
//}

