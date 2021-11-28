//
//  FetchDataStocks.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 25.11.2021.
//

//import Foundation
//class FetchDataStocks: ObservableObject {
//    @Published var tickers = [Result]()
//    @Published var loading = false
//    init() {
//        loading = true
//        fetchData()
//    }
//    func fetchData() {
//        let headers = [
//            "accept": "application/json",
//            "X-API-KEY": "PLWcsaYNih9vmTobMkeOZ3s8yBQcqG0v8kaet5km"
//        ]
//        let url = "https://yfapi.net/v6/finance/quote?region=US&lang=en&symbols=AAPL%2CMSFT%2CNFLX%2CTSLA%2CBAC%2CWMT%2CFNKO%2CPYPL%2CV%2CAMZN"
//        let request = NSMutableURLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error!)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse!)
//            }
//            let decoder = JSONDecoder()
//            do {
//                let ticker = try decoder.decode(TickerInformations.self, from: data!)
//                DispatchQueue.main.async {
//                    self.tickers = ticker.quoteResponse.result
//                    self.loading = false
//                }
//
//
//            } catch {
//                print("--------",error)
//            }
//
//        })
//
//        dataTask.resume()
//
//    }
//}

import Foundation
import SwiftUI
class FetchDataStocks: ObservableObject {
    let APIKey = "ee9627ed00ec29067dd773cb47bc7948"
    @Published var searchingText = ""
    @Published var tickers = Ticker()
    @Published var loading = false
    @Published var tickerInfo = TickerInfo()
    init() {
        loading = true
        fetchData()
    }
    func fetchData() {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(searchingText)&limit=10&exchange=NASDAQ&apikey=\(APIKey)")

        var request = URLRequest(url: url!)

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }

    //        let json = try! JSONSerialization.jsonObject(with: data, options: [])
            
            let ticker = try! JSONDecoder().decode(Ticker.self, from: data)
            DispatchQueue.main.async {
                self.tickers = ticker
                print(self.tickers)
                self.loading = false
               
            }
        }

        task.resume()
         

    }
    func fetchDataStockInfo(tickerSymbol: String) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/profile/\(tickerSymbol)?apikey=\(APIKey)")

        var request = URLRequest(url: url!)

        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let ticker = try! JSONDecoder().decode(TickerInfo.self, from: data)
            DispatchQueue.main.async {
                self.tickerInfo = ticker
                print(self.tickerInfo)
            }
        }

        task.resume()
         

    }
}

