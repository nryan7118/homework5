import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct CatFacts: Decodable {
  let fact: String
  let length: Int
}

struct CatFactsAsyncSequence: AsyncSequence {
  typealias Element = CatFacts
  
  struct AsyncIterator: AsyncIteratorProtocol {
    private var remainingFacts: Int
    
    init(count: Int) {
      self.remainingFacts = count
    }
    
    mutating func next() async throws -> CatFacts? {
      guard remainingFacts > 0 else { return nil }
      
      let url = URL(string: "https://catfact.ninja/fact")!
      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard (response as? HTTPURLResponse)?.statusCode == 200
      else {
        throw URLError(.badServerResponse)
      }
      
      let catFact = try JSONDecoder().decode(CatFacts.self, from: data)
      
      remainingFacts -= 1
      return catFact
    }
  }
  
  let count: Int
  func makeAsyncIterator() -> AsyncIterator {
    return AsyncIterator(count: count)
  }
}
  
  func getCatFacts(count: Int) async {
    let catFactsSequence = CatFactsAsyncSequence(count: count)
    
    do {
      for try await catFact in catFactsSequence {
        print(catFact.fact)
      }
    } catch {
      print("Error feching cat facts: \(error)")
    }
}
  Task {
      print("Fetching cat facts...")
      await getCatFacts(count: 5)
      PlaygroundPage.current.finishExecution()
    }
  

