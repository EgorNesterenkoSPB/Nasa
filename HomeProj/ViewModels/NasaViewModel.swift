//
//  NasaViewModel.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 25.12.2021.
//
//HT4DOD4SLkVipALkiJCtAcVW254aEzIuan6vkDQe api nasa
// 809d2ba8-5ea9-4f80-a655-a0e674d66650 id nasa


import UIKit

protocol NasaViewModelDelegate {
    func didFailWithError(error:Error)
    func didUpdateData(_ nasaViewModel:NasaViewModel,data:NasaData)
}


class NasaViewModel {
    
    var delegate:NasaViewModelDelegate?
    let key = "HT4DOD4SLkVipALkiJCtAcVW254aEzIuan6vkDQe"
    func fetchData(date:String){
    let urlString = "https://api.nasa.gov/planetary/apod?api_key=\(key)&date=\(date)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString:String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data,response,error in
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                }
                else{
                    if let safeData = data {
                     if let currentData = self.parseJSON(safeData){
                            self.delegate?.didUpdateData(self, data: currentData)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    func parseJSON(_ nasaData:Data)->NasaData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NasaData.self, from: nasaData)
            let title = decodedData.title
            let imageString = decodedData.hdurl
            let description = decodedData.explanation
            let NasaData = NasaData(title: title, hdurl: imageString, explanation: description)
            return NasaData
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string)
            else {
                return nil
        }
        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            self.delegate?.didFailWithError(error: error)
        }
        return image
    }
}
