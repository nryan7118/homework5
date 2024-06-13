import Foundation

let sharedSession = URLSession.shared
sharedSession.configuration.allowsCellularAccess
sharedSession.configuration.allowsCellularAccess = false
sharedSession.configuration.allowsCellularAccess

let myDefaultConfiguration = URLSessionConfiguration.default
let ephemralConfiguration = URLSessionConfiguration.ephemeral
let backgroundConfiguartion = URLSessionConfiguration.background(withIdentifier: "com.leariningAbout.URLSession")

myDefaultConfiguration.allowsCellularAccess = false
myDefaultConfiguration.allowsCellularAccess

myDefaultConfiguration.allowsExpensiveNetworkAccess = true
myDefaultConfiguration.allowsConstrainedNetworkAccess = true

let myDefaultSession = URLSession(configuration: myDefaultConfiguration)
myDefaultSession.configuration.allowsConstrainedNetworkAccess

let defaultSession = URLSession(configuration: .default)
defaultSession.configuration.allowsCellularAccess
