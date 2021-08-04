//
//  Ayat.swift
//  hermansyahAdiS-alquran
//
//  Created by Macbook on 28/07/21.
//

import Foundation

import Foundation

struct Ayat: Codable, Identifiable {
    let ids = UUID()
    var ar : String
    var id : String
    var nomor : String
}

class ApiAyat {
    func getSurat(nomor: String ,completion: @escaping ([Ayat]) -> ()) {
        guard let url = URL(string: "https://api.npoint.io/99c279bb173a6e28359c/surat/" + nomor) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let ayats = try! JSONDecoder().decode([Ayat].self, from: data!)
            print(ayats)
            DispatchQueue.main.async {
                completion(ayats)
            }
        }
        .resume()
    }
}
