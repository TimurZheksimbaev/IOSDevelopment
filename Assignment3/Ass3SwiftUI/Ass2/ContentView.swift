//
//  ContentView.swift
//  Ass2
//
//  Created by Тимур Жексимбаев on 22.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var university = "Innopolis University"
    @State var city = "Innopolis"
    @State var showUniAlert = false
    @State var showCityAlert = false
    
    @State var newUni = ""
    @State var newCity = ""
    
    var body: some View {
        
        
        VStack {
            
            
            
            ZStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 300)

                Text("TM").fontWeight(.bold).multilineTextAlignment(.center).bold().font(.largeTitle).frame(alignment: .bottom)

            }
            .padding(.top)
            
            
            
            HStack {
                Text("Timur Zheksimbaev").bold().font(.title)
            }.padding(.bottom)
        
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("University").font(.footnote).foregroundColor(.gray)
                    
                    Text(university)
                    
                }.padding(.bottom)
                
                Spacer()
                
                Button() {
                    showUniAlert = true
                } label: {
                    Image(systemName:
                            "pencil.tip.crop.circle.badge.plus")
                }.padding(.bottom)
                .foregroundColor(.gray)
                .alert("Enter new value", isPresented: $showUniAlert, actions: {
                    
                    
                    TextField("University", text: $newUni)
                    
                    

                    Button ("Done", action: {
                        self.university = newUni
                    })
                    Button("Cancel", role: .cancel, action: {})
                    
                }, message: {})

            }.padding()
            
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("City").font(.footnote).foregroundColor(.gray)
                    
                    Text(city)
                    
                }.padding(.bottom)
                
                Spacer()
                
                Button() {
                    showCityAlert = true
                } label: {
                    Image(systemName:
                            "pencil.tip.crop.circle.badge.plus")
                }.padding(.bottom)
                
                .foregroundColor(.gray)
                .alert("Enter new value", isPresented: $showCityAlert, actions: {
                    
                    
                    TextField("City", text: $newCity)
                

                    Button ("Done", action: {
                        self.city = newCity
                    })
                    Button("Cancel", role: .cancel, action: {})
                    
                }, message: {})

            }.padding()
            
        }
        
        

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
