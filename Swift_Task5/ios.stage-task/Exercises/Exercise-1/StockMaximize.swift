import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        let sortedArray = prices.sorted { $0 > $1 }
        var i = 0
        var b = 0
        for item in prices {
        b +=  (sortedArray[i] - item)
            if (sortedArray[i] - item == 0) {
                i += 1
            }
        }
        return b
    }
}
