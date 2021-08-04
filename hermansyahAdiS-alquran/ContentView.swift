//
//  ContentView.swift
//  hermansyahAdiS-alquran
//
//  Created by Macbook on 27/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var surat: [Surat] = []
    var body: some View {
        NavigationView {
                    List (surat) { surat in
                        NavigationLink(
                            destination: AyatPage(surat: surat)
                            ){
                                HStack{
                                    Text(surat.nomor + ".")
                                        .font(.system(size: 18, weight: .bold, design: .default))
                                    Text(surat.nama)
                                        .font(.system(size: 18, weight: .bold, design: .default))
                                    VStack{
                                    Text(surat.asma)
                                            .font(.system(size: 12, weight: .regular, design: .default))
                                    Text("( " + surat.arti + " )")
                                        .font(.system(size: 12, weight: .regular, design: .default))
                                    
                                    }
                                }
                        }}
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Text("Al Quran")
                                .padding()
                                .font(.system(size: 28, weight: .bold, design: .default))
                                .foregroundColor(.blue)
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink(
                            destination: ProfilePage()
                            ){
                        HStack {
                            Image(systemName: "person.circle")
                        }
                        }
                    }
                }
        }
        .onAppear(){
            print("ini adi")
            Api().getSurat{ (surats) in
                self.surat = surats
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AyatPage: View {
    let surat: Surat
    @State var ayat: [Ayat] = []
    var body: some View {
        VStack {
            List (ayat) { ayat in
                VStack {
                    Text(ayat.ar)
                        .multilineTextAlignment(.trailing)
                        .padding()
                    HStack{
                        Text(ayat.nomor + ".")
                            .font(.system(size: 14, weight: .bold, design: .default))
                        Text(ayat.id)
                    }
                    
                }
                
            }
        }
        .onAppear(){
            print("ini ayat")
            print(surat.nomor)
            ApiAyat().getSurat(nomor: surat.nomor){ (ayats) in
                self.ayat = ayats
            }
        }
        .navigationBarTitle(Text(surat.nama))
    }
}

struct ProfilePage: View {
    var body: some View {
        VStack {
            Image("imageProfile")
                .resizable()
                .cornerRadius(10)
                .frame(width: 150, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text("Nama : Hermansyah Adi Saputra")
            Text("App : Al Quran (SwiftUI)")
            Text("Belajar Membuat Aplikasi iOS untuk Pemula")
                .padding()
            Spacer()
        }
        .navigationBarTitle("Profile")
    }
}
