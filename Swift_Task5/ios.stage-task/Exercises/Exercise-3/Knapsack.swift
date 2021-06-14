import Foundation


extension Collection {

  public var powerSet: [[Element]] {
    
    
    guard let fisrt = self.first else {return [[]]}
    return self.dropFirst().powerSet.flatMap{[$0, [fisrt] + $0]}
  }
}


public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        
        
        var a1 = foods.powerSet
        var b1 = drinks.powerSet

       

        var array1 = [(Int, Int)]()
        var array2 = [(Int, Int)]()

        for item in a1 {
           
            
            
            var counter2 = 0
            var count = item.count
            var weight = 0
            var kw = 0
            
            for i in item {
                
                counter2 += 1
                weight += i.0
                kw += i.1
                
                if count == counter2 {
                    
                    array1.append((weight, kw))
                }
                
              
                
            }
        }





        for item in b1 {
            print( item)
            
            
            var counter2 = 0
            var count = item.count
            var weight = 0
            var kw = 0
            
            for i in item {
                
                counter2 += 1
                weight += i.0
                kw += i.1
                
                if count == counter2 {
                    
                    array2.append((weight, kw))
                }
            }
        }
        print("array1\(array1)")
        print("array2\(array2)")

        var result = 0
        for item in array1 {
            
            
            
            
            for item2 in array2 {
                
                if  item.0 + item2.0 <= maxWeight {
                    
                    if item.1 < item2.1 && item.1 > result  {
                        
                        result = item.1
                    } else if item2.1 < item.1 &&  item2.1 > result {
                        
                        result = item2.1
                    } else if item.1 == item2.1 && item.1 > result {
                        
                        result = item.1
                    }
                    
                }
                
                
            }
        }

        return result
    }
}
