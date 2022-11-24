//
//  ViewController.swift
//  WeatherApp
//
//  Created by npc on 2020/11/30.
//  Copyright © 2020 npc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let url = "https://api.openweathermap.org/data/2.5/onecall"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard var urlComponents = URLComponents(string: url) else {
            print("エラーの内容")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "35.698965177103844"),
            URLQueryItem(name: "lon", value: "139.69676479999467"),
            URLQueryItem(name: "lang", value: "ja"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "自分のキー")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            do {
                let data = try JSONDecoder().decode(OneCallWeather.self, from: data!)
                print(data)
            } catch {
                print(error)
            }
        }
        
        task.resume()
         
    }


}

