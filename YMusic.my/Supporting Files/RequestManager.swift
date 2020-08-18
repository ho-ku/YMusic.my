//
//  RequestManager.swift
//  YMusic.my
//
//  Created by Денис Андриевский on 20.07.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import Foundation

class RequestManager {
    
    private let apiKey = "AIzaSyAqHAgq1C3obK_dpAF6Vd1mjkYchf4F-_g"
    
    func fetchChannel(id: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let parameters = [URLQueryItem(name: "id", value: id), URLQueryItem(name: "key", value: apiKey), URLQueryItem(name: "part", value: "snippet,statistics")]
        guard var urlComps = URLComponents(string: "https://www.googleapis.com/youtube/v3/channels") else { return }
        urlComps.queryItems = parameters
        guard let url = urlComps.url else { return }
        let dataTask = URLSession(configuration: .default).dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
    
    func fetchImage(urlString: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let dataTask = URLSession(configuration: .default).dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
    
}
