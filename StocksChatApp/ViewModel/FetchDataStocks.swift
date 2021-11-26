//
//  FetchDataStocks.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 25.11.2021.
//

import Foundation
class FetchDataStocks: ObservableObject {
    @Published var tickers = [Result]()
    @Published var loading = false
    init() {
        loading = true
        fetchData()
    }
    func fetchData() {
        let headers = [
            "accept": "application/json",
            "X-API-KEY": "nrlO9zOH9o8k1D7BtPVbw5MDA62fHv3y5zQb3C6S"
        ]
        let url = "https://yfapi.net/v6/finance/quote?region=US&lang=en&symbols=AAPL%2CMSFT%2CNFLX%2CTSLA%2CBAC%2CWMT%2CFNKO%2CPYPL%2CV%2CAMZN"
        let request = NSMutableURLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
            let decoder = JSONDecoder()
            do {
                let ticker = try decoder.decode(TickerInformations.self, from: data!)
                DispatchQueue.main.async {
                    self.tickers = ticker.quoteResponse.result
                    self.loading = false
                }

                
            } catch {
                print("--------",error.localizedDescription)
            }
            
        })

        dataTask.resume()
        
    }
}



