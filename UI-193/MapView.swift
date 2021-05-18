//
//  MapView.swift
//  UI-193
//
//  Created by にゃんにゃん丸 on 2021/05/18.
//

import SwiftUI
import MapKit

struct MapView: View {
    let with = UIScreen.main.bounds.width
    @State var show = false
    var body: some View {
       
        VStack{
            
            CreateMapView()
                .frame(width: 768, height: 500)
            
            ZStack{
                
            
                    
                    Circle()
                        .stroke(Color.red,lineWidth: 30)
                        .frame(width: with * 0.8, height: with * 1.62)
                    
                    
                    Circle()
                        .stroke(Color.white,style: StrokeStyle(lineWidth: 5, dash: [20,20,20]))
                        .frame(width: with * 0.8)
                    
                  
                
                
                       
                    Image(systemName: "car.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .offset(x: -with * 0.4)
                        .rotationEffect(.init(degrees: show ? 360 : 0))
                        .animation(.linear(duration: 5).repeatForever(autoreverses: false))
                        .onTapGesture {
                            show.toggle()
                        }
                        
                    
                    
                
            }
            
            
            
               
            
       
            
            
            
        }
            
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct CreateMapView : UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        
        let view = MKMapView(frame: .zero)
        
        return view
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
        let coodinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: coodinate, span: span)
        
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coodinate
        annotation.title = "北極"
        
        uiView.addAnnotation(annotation)
        
        
    }
}
