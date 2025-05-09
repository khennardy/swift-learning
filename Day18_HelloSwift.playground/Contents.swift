import UIKit

// Enums + switch combo //

enum Weather {
    case sunny
    case rainy
    case cloudy
    case stormy
}

func describe(weather: Weather) {
    switch weather {
    case .sunny:
        print( "It is a sunny day! Time to walk the dogs!" )
    case .rainy:
        print( "It is raining cats and dogs!" )
    case .cloudy:
        print( "It is a cloudy day." )
    case .stormy:
        print( "It is storming!" )
    }
    }

let today = Weather.sunny
describe(weather: today)

enum DeliveryStatus {
    case delivered(date: String)
    case inTransit
    case delayed(reason: String)
}

func track(status: DeliveryStatus) {
    switch status {
    case .delivered(let date):
        print("Delivered on \(date).")
    case .inTransit :
        print("Your package is on the way!")
    case .delayed(let reason):
        print("Delayed because: \(reason).")
    }
    }

let deliveryStatus: DeliveryStatus = .delayed(reason: "Traffic jam")
track(status: deliveryStatus)
track(status: .delivered(date: "2025-05-10"))
