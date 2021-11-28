//
//  TickerData.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 25.11.2021.
//

//import Foundation
//
//// MARK: - TickerInformations
//struct TickerInformations: Codable {
//    let quoteResponse: QuoteResponse
//}
//
//// MARK: - QuoteResponse
//struct QuoteResponse: Codable {
//    let result: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let language: Language
//    let region: Region
//    let quoteType: QuoteType
//    let quoteSourceName: QuoteSourceName
//    let triggerable: Bool
//    let firstTradeDateMilliseconds, priceHint: Int
//    let preMarketChange, preMarketChangePercent: Double
//    let preMarketTime: Int
//    let preMarketPrice, regularMarketChange, regularMarketChangePercent: Double
//    let regularMarketTime: Int
//    let regularMarketPrice, regularMarketDayHigh: Double
//    let regularMarketDayRange: String
//    let regularMarketDayLow: Double
//    let regularMarketVolume: Int
//    let regularMarketPreviousClose: Double
//    let bid, ask, bidSize, askSize: Int
//    let fullExchangeName: FullExchangeName
//    let financialCurrency: Currency
//    let regularMarketOpen: Double
//    let averageDailyVolume3Month, averageDailyVolume10Day: Int
//    let fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent: Double
//    let fiftyTwoWeekRange: String
//    let fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekLow, fiftyTwoWeekHigh: Double
//    let dividendDate: Int?
//    let earningsTimestamp, earningsTimestampStart, earningsTimestampEnd: Int
//    let trailingAnnualDividendRate: Double?
//    let trailingPE: Double
//    let trailingAnnualDividendYield: Double?
//    let epsTrailingTwelveMonths, epsForward, epsCurrentYear, priceEpsCurrentYear: Double
//    let sharesOutstanding: Int
//    let bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent: Double
//    let twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent: Double
//    let marketCap: Int
//    let forwardPE, priceToBook: Double
//    let sourceInterval, exchangeDataDelayedBy: Int
//    let pageViewGrowthWeekly: Double
//    let averageAnalystRating: String
//    let currency: Currency
//    let tradeable: Bool
//    let marketState: MarketState
//    let messageBoardID: String
//    let exchangeTimezoneName: ExchangeTimezoneName
//    let exchangeTimezoneShortName: ExchangeTimezoneShortName
//    let gmtOffSetMilliseconds: Int
//    let market: Market
//    let esgPopulated: Bool
//    let shortName: String
//    let exchange: Exchange
//    let longName, displayName, symbol: String
//
//    enum CodingKeys: String, CodingKey {
//        case language, region, quoteType, quoteSourceName, triggerable, firstTradeDateMilliseconds, priceHint, preMarketChange, preMarketChangePercent, preMarketTime, preMarketPrice, regularMarketChange, regularMarketChangePercent, regularMarketTime, regularMarketPrice, regularMarketDayHigh, regularMarketDayRange, regularMarketDayLow, regularMarketVolume, regularMarketPreviousClose, bid, ask, bidSize, askSize, fullExchangeName, financialCurrency, regularMarketOpen, averageDailyVolume3Month, averageDailyVolume10Day, fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent, fiftyTwoWeekRange, fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekLow, fiftyTwoWeekHigh, dividendDate, earningsTimestamp, earningsTimestampStart, earningsTimestampEnd, trailingAnnualDividendRate, trailingPE, trailingAnnualDividendYield, epsTrailingTwelveMonths, epsForward, epsCurrentYear, priceEpsCurrentYear, sharesOutstanding, bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent, twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent, marketCap, forwardPE, priceToBook, sourceInterval, exchangeDataDelayedBy, pageViewGrowthWeekly, averageAnalystRating, currency, tradeable, marketState
//        case messageBoardID = "messageBoardId"
//        case exchangeTimezoneName, exchangeTimezoneShortName, gmtOffSetMilliseconds, market, esgPopulated, shortName, exchange, longName, displayName, symbol
//    }
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}
//
//enum Exchange: String, Codable {
//    case nms = "NMS"
//    case nyq = "NYQ"
//}
//
//enum ExchangeTimezoneName: String, Codable {
//    case americaNewYork = "America/New_York"
//}
//
//enum ExchangeTimezoneShortName: String, Codable {
//    case est = "EST"
//}
//
//enum FullExchangeName: String, Codable {
//    case nasdaqGS = "NasdaqGS"
//    case nyse = "NYSE"
//}
//
//enum Language: String, Codable {
//    case enUS = "en-US"
//}
//
//enum Market: String, Codable {
//    case usMarket = "us_market"
//}
//
//enum MarketState: String, Codable {
//    case pre = "PRE"
//}
//
//enum QuoteSourceName: String, Codable {
//    case delayedQuote = "Delayed Quote"
//    case nasdaqRealTimePrice = "Nasdaq Real Time Price"
//}
//
//enum QuoteType: String, Codable {
//    case equity = "EQUITY"
//}
//
//enum Region: String, Codable {
//    case us = "US"
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}


import Foundation

// MARK: - TickerElement
struct TickerElement: Codable {
    let symbol, name: String
    let currency: Currency
    let stockExchange: String
    let exchangeShortName: ExchangeShortName
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum ExchangeShortName: String, Codable {
    case nasdaq = "NASDAQ"
}

typealias Ticker = [TickerElement]


struct TickerInfoElement: Codable {
    let symbol: String
    let price, beta: Double
    let volAvg, mktCap: Int
    let lastDiv: Double
    let range: String
    let changes: Double
    let companyName, currency, cik, isin: String
    let cusip, exchange, exchangeShortName, industry: String
    let website: String
    let tickerInfoDescription, ceo, sector, country: String
    let fullTimeEmployees, phone, address, city: String
    let state, zip: String
    let dcfDiff, dcf: Double
    let image: String
    let ipoDate: String
    let defaultImage, isEtf, isActivelyTrading, isAdr: Bool
    let isFund: Bool

    enum CodingKeys: String, CodingKey {
        case symbol, price, beta, volAvg, mktCap, lastDiv, range, changes, companyName, currency, cik, isin, cusip, exchange, exchangeShortName, industry, website
        case tickerInfoDescription = "description"
        case ceo, sector, country, fullTimeEmployees, phone, address, city, state, zip, dcfDiff, dcf, image, ipoDate, defaultImage, isEtf, isActivelyTrading, isAdr, isFund
    }
}

typealias TickerInfo = [TickerInfoElement]
