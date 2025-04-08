

//
//  ContentView.swift
//  Textile Recyling App
//
//  Created by 桃井利久斗 on 2021/06/13.
//


import SwiftUI
import MapKit
import Foundation
import SwiftyJSON

struct MapView1: View{
    @State var selected = ""
    @State var show = false
    @State var text: String = ""
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    var body : some View{
        NavigationView{
            ZStack{
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted) .font(.caption2).bold()

                                Image(systemName: "mappin.and.ellipse").font(.title2).foregroundColor(.red).shadow(radius: 1)
                            }
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                            }
                        }
                    }
                }
                VStack{
                    Spacer()
                    RadioButtons1().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
    }
    private func readFile() {
        if let url = Bundle.main.url(forResource: "nonprofit_list", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
}


struct ContentViewPBL: View {
    @State private var ShowMainView = false
    var body: some View{
        Group{
            if ShowMainView{
                ZStack{
                    ViewF()
                }
            } else{
                ZStack{
                    Image("Image2").resizable().renderingMode(.original).frame(width:600, height: 1000 )
                    VStack{
                        Text("Welcome to").font(.system(size: 38, weight: .medium  , design: .default)).foregroundColor(.white).padding()
                        Text("Drawer Drop").frame(width: 250, height: 50).background(Color.black, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).font(.system(size: 35, weight: .bold  , design: .default)).foregroundColor(.white).background(Color.black).cornerRadius(40).padding()
                        
                        Image("Image1").resizable().renderingMode(.original).frame(width: 120, height: 120).padding(70)
                        
                    }
                }
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation(Animation.easeOut(duration: 2)){
                    ShowMainView = true
                }
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPBL()
    }
}







struct MapView2: View{
    @State var selected = ""
    @State var show = false
    @State var text: String = ""
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted).font(.caption2).bold()
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                            }
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                                /*after butoon opersation */
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RadioButtons3().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "shoes_list", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
    
}


struct MapView3: View{
    @State var selected = ""
    @State var text: String = ""
    @State var show = false
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted)
                                                                  .font(.caption2)
                                                                  .bold()
                                
                               
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                            }
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                                /*after butoon opersation */
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RadioButtons().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "clothing_list(3)", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
    
}


struct MapView4: View{
    @State var selected = ""
    @State var show = false
    @State var text: String = ""
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted)
                                                                  .font(.caption2)
                                                                  .bold()
                                
                                
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                            }
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                                /*after butoon opersation */
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RadioButtons2().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "Coats_list(2)", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
}






struct MapView5: View{
    @State var selected = ""
    @State var show = false
    @State var text: String = ""
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted)
                                                                  .font(.caption2)
                                                                  .bold()
                                
                                
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                            }
                                                       
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                                /*after butoon opersation */
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RadioButtons1().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "Towels_list", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
}

struct JSONData1: Decodable {
    let locations1: [Location1]
}

struct Location1: Decodable, Identifiable {
    let id: Int
    let Items_Accepted: String
    let latitude: Double
    let longitude: Double
    
    
    
}


struct MapView6: View{
    @State var selected = ""
    @State var show = false
    @State var text: String = ""
    @State private var locations1: [Location1] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations1
                    ) { locations1 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations1.latitude,
                                longitude: locations1.longitude
                            )
                        ) {
                            VStack {
                                Text(locations1.Items_Accepted)
                                                                  .font(.caption2)
                                                                  .bold()
                                
                                
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                            }
                                                       
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            TextField("Type your search",text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white)
                                } )
                                Button(action: {
                                    
                                    self.show.toggle()
                                    
                                }) {
                                    
                                    Text("Open").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                                }
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                                /*after butoon opersation */
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                VStack{
                    Spacer()
                    RadioButtons1().offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
                
            }.background(Color("Color2").edgesIgnoringSafeArea(.all))
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "Profit_list(1)", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData1 = try? decoder.decode(JSONData1.self, from: data) {
                self.locations1 = jsonData1.locations1
            }
        }
    }
    
}
struct JSONData2: Decodable {
    let locations2: [Location2]
}

struct Location2: Decodable, Identifiable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let Nonprofit_Organization: String
}



struct MapView7: View{
    @State var selected = ""
    @State var show = false
   
    @State private var locations2: [Location2] = []
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.58115, longitude: -73.96376),
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    )
    var body : some View{
        NavigationView{
            ZStack{
                
                VStack{
                    
                    Map(
                        coordinateRegion: $coordinateRegion,
                        annotationItems: locations2
                    ) { locations2 in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: locations2.latitude,
                                longitude: locations2.longitude
                            )
                        ) {
                           
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .shadow(radius: 1)
                          
                            
                        }
                    }
                    .onAppear(perform: readFile).preferredColorScheme(.dark)
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        VStack{
                            HStack{
                                
                                Button(action: { withAnimation{ coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)}}, label:{ Text(" Your Location").bold().frame(width: 250, height: 50, alignment: .center).background(Color.blue).cornerRadius(8).foregroundColor(.white).padding(.vertical, 20)
                                } )
                                
                                
                                /*after butoon opersation */
                                
                                
                            }.background(Color.blue).cornerRadius(8)
                            
                        }
                        
                    }
                    
                }
                
            }
            .animation(.default)
        }
        
    }
    
    
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "EveryLocations", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData2 = try? decoder.decode(JSONData2.self, from: data) {
                self.locations2 = jsonData2.locations2
            }
        }
    }
    
}





struct ViewF: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7, longitude: -74),
        span: MKCoordinateSpan(latitudeDelta: 150, longitudeDelta: 150)
    )
    var body: some View {
        
        TabView {
            MapView7()
                .tabItem {
                    
                    Text("Home")
                    Image(systemName: "house.fill")
                    
                    
                    
                }
            
            FilterView()
                .tabItem {
                    Text("Filter")
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            
            Rikuto()
                .tabItem {
                    Text("Setting")
                    Image(systemName: "gear")
                    
                }
        }
    }
}



struct Rikuto: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("Image2").resizable().renderingMode(.original).frame(width: 500, height: 900 )
                VStack{
                    Text("Ensure how to sort your unwanted Texttile?!!").font(.system(size: 30, weight: .bold  , design: .default)).foregroundColor(.white).padding().padding()
                    
                    VStack{
                        Text("                here's some guidance              ").font(.system(size: 30, weight: .medium  , design: .default)).foregroundColor(.white).padding()
                        
                        NavigationLink(destination: Screen1()) {
                            VStack{
                                
                                HStack{
                                    Image(systemName: "checkmark.circle").resizable().renderingMode(.original).frame(width: 60, height: 60).padding()
                                    Image(systemName: "multiply").resizable().renderingMode(.original).frame(width: 50, height: 50)
                                }
                                
                                Text("       Dos and don'ts           ").font(.system(size: 20, weight: .medium  , design: .default)).foregroundColor(.black).background(Color.white)
                            }.background(Color.white).frame(width: 200, height: 100).padding()
                        }
                        NavigationLink(destination: Screen2()) {
                            VStack{
                                HStack{
                                    Image(systemName: "envelope").resizable().renderingMode(.original).frame(width: 50, height: 50).padding()
                                    Image(systemName: "line.horizontal.3.decrease.circle").resizable().renderingMode(.original).frame(width: 50, height: 50).padding()
                                    
                                }.background(Color.white)
                                Text(" Prepare & how to set       ").font(.system(size: 20, weight: .medium  , design: .default)).foregroundColor(.black).background(Color.white)
                                
                                
                                
                            }.background(Color.white).frame(width: 200, height: 100).padding()
                        }
                        NavigationLink(destination: Screen3()) {
                            
                            VStack{
                                HStack{
                                    Image(systemName: "questionmark").resizable().renderingMode(.original).frame(width: 50, height: 50).padding()
                                    
                                    
                                }.background(Color.white)
                                Text("        Ask questions            ").font(.system(size: 20, weight: .medium  , design: .default)).foregroundColor(.black).background(Color.white)
                                
                            }.background(Color.white).frame(width: 200, height: 100)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct Screen1 : View {
    var body: some View {
        ZStack{
            Color.white
                  .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Group{
                    Text("Do’s & Don’ts for").font(.system(size: 28, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal,20).padding(.bottom, 0)
                    Text("Donation/Resale").font(.system(size: 28, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 20).padding(.bottom, 0)
                }
              
                Group{
                    Text("If you wish to opt for donation or resale, make  ").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 20).padding(.bottom, 0).padding(.top, 30)
                    Text("sure to check if your items are suitable.").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                    Text("Otherwise, it’s better to opt for recycle.").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 20).padding(.top, 5)
                }
              
                Group{
                Text("Ideal for donation/resale:").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal,20).padding(.bottom, 0).padding(.top, 30)
                    Text("•    Fashion items that you haven’t worn for long.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Fashion items that are too small for you.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Fashion items that no longer fit your style.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Can also include rarely used bedding or curtains.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                }
                
                Group{
                Text("Not ideal for donation/resale:").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal,20).padding(.bottom, 0).padding(.top, 30)
                Text("•    Undergarments.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Clothing that have holes or tears.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Clothing that have weird smell.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                Text("•    Clothing that have spots or stains.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 20)
                }
                Spacer()






            }
        }
    }
}
struct Screen2 : View {
    var body: some View {
        ZStack{
            Color.white
                  .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Group{
                    Text("How to sort your textiles").font(.system(size: 28, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal,30).padding(.bottom, 0)
                    Text("before drop-off:").font(.system(size: 28, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 0)
                }
              
                Group{
                    Text("Just a few reminders and then you’re good to go!").font(.system(size: 12, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 0).padding(.top, 30)
                       
                }
              
                Group{
                Text("1.  Make sure all items have been recently washed").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.top, 20).padding(.bottom, 0)
                Text("    or dry cleaned.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 5)
                Text("2. Properly fold them in a bag, in case some drop-off").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 0)
                Text("    points does not have their own compartments.").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 5)
                Text("3. If the drop-off point provide different sections").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 0)
                Text("    for different items, make sure to follow them.   ").font(.system(size: 12, weight: .medium , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 5)
                }
                Spacer()






            }
        }
    }
}

struct FilterView : View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        VStack{
                            Text("Filter your conditions and preferences:").font(.system(size: 25, weight: .bold  , design: .default)).foregroundColor(.white).padding(.leading, 10).padding(.bottom, 0)
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 300, height: 2)
                            
                            Text("Select all that apply").font(.system(size: 12, weight: .light  , design: .default)).foregroundColor(.white).padding(.leading, 10).padding(.bottom, 10).padding(.top, 5)
                        }
                    }
                    HStack{
                        Text("Items accepted :").font(.system(size: 25, weight: .medium  , design: .default)).foregroundColor(.black).padding()
                    }
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: MapView3()) {
                                
                                Text("clothes").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                            }
                            
                            NavigationLink(destination: MapView2()) {
                                
                                Text("shoes").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                            }
                        }
                        
                        
                        HStack{
                            NavigationLink(destination: MapView4()) {
                                
                                Text("Coats").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                            }
                            NavigationLink(destination: MapView5()) {
                                
                                Text("Towels").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                            }
                            
                        }
                        VStack{
                            
                            Text("Operation  :").font(.system(size: 25, weight: .medium  , design: .default)).foregroundColor(.white).padding()
                            HStack{
                                NavigationLink(destination: MapView1()) {
                                    
                                    Text("Recycle").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                                }
                                NavigationLink(destination: MapView1()) {
                                    
                                    Text("Donate").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                                }
                            }
                            
                        }
                        VStack{
                            Text("Organization :").font(.system(size: 25, weight: .medium  , design: .default)).foregroundColor(.white).padding()
                            HStack{
                                NavigationLink(destination: MapView6()) {
                                    
                                    Text("Profit").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 90, height: 50)).padding()
                                }
                                NavigationLink(destination: MapView1()) {
                                    
                                    Text("None-profit").font(.system(size: 20, weight: .light  , design: .default)).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).stroke().stroke(lineWidth: 2).background(Color.white.cornerRadius(10)).frame(width: 110, height: 50)).padding()
                                }
                            }
                            
                        }
                        
                        
                        
                    }
                }
                
            }.preferredColorScheme(.dark)
        }
    }
}

struct Screen3 : View {
    var body: some View {
        ZStack{
            Color.white
                  .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Group{
                    Text("Could not find what you are looking for?").font(.system(size: 28, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 0)
                }
              
                Group{
                    Text("Ask us!").font(.system(size: 16, weight: .bold  , design: .default)).foregroundColor(.black).padding(.horizontal, 30).padding(.bottom, 20).padding(.top, 15)
                       
                }
              
                Group{
                    VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray)
                        .frame(width: 310, height: 180)
                        .padding(.leading, 30)
                            .padding(.bottom, 10)
                                
                    VStack{
                        HStack{
                        Text("Write your questions here").font(.system(size: 14, weight: .light , design: .default)).foregroundColor(.black)
                            .padding(.leading, 30)
                            
                                
                        }
                    }
                    }
                        ZStack{
                       
                            Button(action: {
                                print("Send")
                            }, label: {
                                Text("Send")
                                    .font(.system(size: 14, weight: .bold , design: .default)).foregroundColor(.white)
                                        .padding(.leading, 230)
                                    .padding(.top, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.blue)
                                        .frame(width: 90, height: 40)
                                        .padding(.leading, 230)
                                            .padding(.top, 10)
                                    )
                            })
                        }
                }
                }
                Spacer()






            }
        }
    }
}


struct RadioButtons : View {
    @State private var viewModel = ContentViewModel()
        var body : some View{
            ZStack{
                Color.white
                                   .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Nearest drop off points found :").font(.title).foregroundColor(.black).padding()

                   ForEach(viewModel.items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 10){
                            NavigationLink(destination: DetailView(data: item)) {
                            Text(item.Vendor_Name).font(.system(size: 15)) .foregroundColor(.black)
                               
                            }
                       }
                        }.listStyle(GroupedListStyle())
             }.onAppear(perform: {
                viewModel.fetchData()
             })
                
            }.padding(.vertical)
                .padding(.horizontal,25)
                .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
                .background(Color.white)
                .cornerRadius(30)
            
        }
        }

struct RadioButtons1 : View {
    @State private var viewModel = ContentViewModel()
        var body : some View{
            ZStack{
                Color.white
                                   .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Nearest drop off points found :").font(.title).foregroundColor(.black).padding()

                   ForEach(viewModel.items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 10){
                            NavigationLink(destination: DetailView(data: item)) {
                            Text(item.Vendor_Name).font(.system(size: 15)) .foregroundColor(.black)
                               
                            }
                       }
                        }.listStyle(GroupedListStyle())
             }.onAppear(perform: {
                viewModel.fetchData()
             })
                
            }.padding(.vertical)
                .padding(.horizontal,25)
                .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
                .background(Color.white)
                .cornerRadius(30)
            
        }
        }


struct RadioButtons2 : View {
    @State private var viewModel = ContentViewModel()
        var body : some View{
            ZStack{
                Color.white
                                   .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Nearest drop off points found :").font(.title).foregroundColor(.black).padding()

                   ForEach(viewModel.items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 10){
                            NavigationLink(destination: DetailView(data: item)) {
                            Text(item.Vendor_Name).font(.system(size: 15)) .foregroundColor(.black)
                               
                            }
                       }
                        }.listStyle(GroupedListStyle())
             }.onAppear(perform: {
                viewModel.fetchData()
             })
                
            }.padding(.vertical)
                .padding(.horizontal,25)
                .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
                .background(Color.white)
                .cornerRadius(30)
            
        }
        }

struct RadioButtons3 : View {
    @State private var viewModel = ContentViewModel()
        var body : some View{
            ZStack{
                Color.white
                                   .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Nearest drop off points found :").font(.title).foregroundColor(.black).padding()

                   ForEach(viewModel.items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 10){
                            NavigationLink(destination: DetailView(data: item)) {
                            Text(item.Vendor_Name).font(.system(size: 15)) .foregroundColor(.black)
                               
                            }
                       }
                        }.listStyle(GroupedListStyle())
             }.onAppear(perform: {
                viewModel.fetchData()
             })
                
            }.padding(.vertical)
                .padding(.horizontal,25)
                .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
                .background(Color.white)
                .cornerRadius(30)
            
        }
        }











struct DetailView: View {
    var data: Model
  var body: some View {
    ZStack{
        Color.white
            .edgesIgnoringSafeArea(.all)
        VStack {
            HStack{
                Text("Address : ").foregroundColor(.black).bold()
                Text(data.Address).foregroundColor(.black)
            }.padding()
            Text("Items_Accepted : ").bold().foregroundColor(.black)
            Text(data.Items_Accepted).foregroundColor(.black).padding()
            
            Text("Vendor_Name : ").bold().foregroundColor(.black)
            Text(data.Vendor_Name).foregroundColor(.black).padding()
          
        }
       
    }
    
    .navigationTitle(Text(verbatim: data.Items_Accepted))
    .navigationBarTitleDisplayMode(.inline)
  }
}


struct Model: Codable, Identifiable{
   var id: Int
   var Address: String
   var Items_Accepted: String
   var Vendor_Name: String
}

class ContentViewModel: ObservableObject {
  @Published var items = [Model]()
  func fetchData() {
    let api = "http://18.176.162.126/datainfo/shoes_list"
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode([Model].self, from: data)
           DispatchQueue.main.async {
              self.items = result
           }
         } else {
           print("No data")
         }
      } catch (let error) {
         print(error.localizedDescription)
      }
     }.resume()
  }
}
