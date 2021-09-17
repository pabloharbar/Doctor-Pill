//
//  APIWrapper.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 09/09/21.
//

import Foundation

class APIWrapper {
    
    func fetchSimilars(recognizedText: String, completion: @escaping (Data) -> Void) {
        
        var components = URLComponents(string: "http://186.214.192.214/similar")!
        
        let queryItem = URLQueryItem(name: "name", value: recognizedText)
        components.queryItems = [queryItem]
        
        let request = URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                completion(data)
            }
        }
        request.resume()
    }
    
    func decodeSimilars(recognizedText: String, completion: @escaping ([String]) -> Void) {
        self.fetchSimilars(recognizedText: recognizedText) { data in
            let decoder = JSONDecoder()
            print(data)
            do {
                let response = try decoder.decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    var similarsResponse = response.similars
                    similarsResponse.append(response.name)
                    similarsResponse.append(response.sent)
                    completion(similarsResponse)
                }
            } catch let error {
                print("deu ruim o decode", error)
            }
        }
    }
}
