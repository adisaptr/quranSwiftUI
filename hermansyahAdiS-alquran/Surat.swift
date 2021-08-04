//
//  Surat.swift
//  hermansyahAdiS-alquran
//
//  Created by Macbook on 28/07/21.
//

import Foundation

struct Surat: Codable, Identifiable {
    let id = UUID()
    var nama : String
    var arti : String
    var asma : String
    var ayat : Int
    var nomor : String
}

class Api {
    func getSurat(completion: @escaping ([Surat]) -> ()) {
        guard let url = URL(string: "https://api.npoint.io/99c279bb173a6e28359c/data") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let surats = try! JSONDecoder().decode([Surat].self, from: data!)
            print(surats)
            DispatchQueue.main.async {
                completion(surats)
            }
        }
        .resume()
    }
}
