import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        
//1. переводим message в массив символов
        
        let charactersArray = Array(message)
        
//2. создаем счетчик скобок
        
        var counter = 0
        var counterAll = 0
        var counter1 = 0
        var counter2 = 0
//Счетчик итерация
        var iterationCounter = 0

//3. Создаем массив для цифр
  // промежуточный массив
var arrayIntIntermediate = [Character]()
 //массив обработанных цифр
var arrayIntegers = [Int]()
        
        
        var arrayDop2 = [String]()
        
//4. Создаем массив для букв
        
    // промежуточный массив
        
var stringBufferArray = [Character]()
        
        // массив обработаных символов
        
var stringArray = [String]()

        var stringArray2 = [String]()
        
// 5 Финальный массив
        
var finalArray = [String]()
        
// -----------Итерируемся по массиву символов------------------------------------------------
        
        for item in charactersArray {
            
            
 var arrayDop = [String]()
            
   iterationCounter += 1
            
// Задаем условия счетчика скобок
            if (item == "[") {
                counterAll += 1
                counter += 1
                counter1 += 1
            }
            
         
            
            
            
// Задаем условия для цифр
            
if let intValue = item.wholeNumberValue {
//Добавляем символ в промежточный массив
arrayIntIntermediate.append(item)
} else if (arrayIntIntermediate.count > 0 ) { let str = String(arrayIntIntermediate)
// Преобразуем в фифру и добавляем в конечный массив цифр
                arrayIntegers.append(Int(str)!)
                arrayIntIntermediate.removeAll()
    }

            if (counter > arrayIntegers.count) {
                
                arrayIntegers.append(1)
                
            }
            
//Задаем условия для букв
            
            if ((item >= "a" && item <= "z") || (item >= "A" && item <= "Z")) {
                
                stringBufferArray.append(item)
                
            } else if (stringBufferArray.count > 0 && counter2 == 0  ) {
                
                stringArray.append(String(stringBufferArray))
                stringBufferArray.removeAll()
                
            } else if (stringBufferArray.count > 0 && counter2 >= 1  ) {
                
                stringArray2.append(String(stringBufferArray))
                stringBufferArray.removeAll()
                
                
            }
            
            
            
            
            
            
            
            if (stringBufferArray.count > 0 && iterationCounter == charactersArray.count) {
                
                stringArray.append(String(stringBufferArray))
                stringBufferArray.removeAll()
            }
            
            if (item == "]") {

                counterAll += 1
                counter -= 1
                counter2 += 1
                
                if( counterAll > 2) {
                    
                    if (stringArray2.count > 0) {
                        
                        arrayDop2.append(stringArray2.last!)
                        
                    }
                    
                    if (arrayIntegers.count > 0 && stringArray.count > 0) {
                        
                        
                        
                        
                        if ( arrayIntegers.last! > 0) {
                        
                        arrayDop = arrayDop2
                     
                        
                        arrayDop.insert(stringArray.last!, at: 0)
                       
                        arrayDop2 = arrayDop

                        
                        
                        for i in 0 ..< arrayIntegers.last! - 1  {
                            
                             

                            arrayDop2.append(contentsOf: arrayDop)

                            
                           // arrayDop2 += arrayDop
                            
                         //   finalArray.insert(stringArray.last!, at: 0)
                       // finalArray.append(stringArray.last!)
                    }
                        
                         
                        arrayIntegers.removeLast()
                        stringArray.removeLast()
                       
                        } else {
                            arrayIntegers.removeLast()
                            stringArray.removeLast()
                            
                        }
                        
                        
                    }
                    

                    
                    if (arrayIntegers.count > 0 && stringArray.count == 0){
                        
                        while (arrayIntegers.count != 0) {
                        
                            if (arrayIntegers.last! > 0) {
                        arrayDop = arrayDop2
                        
                        for i in 0 ..< arrayIntegers.last! - 1 {
                            
                            
                            
                            arrayDop2.append(contentsOf: arrayDop)
                             
                        }
                                
                                arrayIntegers.removeLast()
                            } else {
                                
                                arrayIntegers.removeLast()
                                arrayDop2.removeAll()
                            }
                       
                        
                       // finalArray += arrayDop2
                        
                     //   counterAll = 0
                        
                       // finalArray.insert(stringArray.last!, at: 0)
                     //   finalArray.append(stringArray.last!)  }
                    
                    
                    
                 //   stringArray.removeLast()
                    
                    
                    
                    
                    
                }
                    }
                
            }
            }
            
            
            if (counter == 0 && stringArray.count > 0 && counterAll <= 2) {
                
                if (arrayIntegers.count > 0) {
                    for i in 0 ..< arrayIntegers.last! {
                    finalArray.append(stringArray.last!)
                }
                    arrayIntegers.removeLast()
                    
                } else {  finalArray.append(stringArray.last!)  }
                
                
                
                stringArray.removeLast()
                
            }
            
            if (counter == 0 && counterAll > 2) {
                
                finalArray += arrayDop2
                 arrayDop2.removeAll()
                
            }
            
            
            
           
            
            if (counter == 0) {
                
                counterAll = 0
                counter1 = 0
                counter2 = 0
            }
            
            
            
            
            
        }
        
//----------КОнвертируем финальный массив строк в строку
        let stringFinal = finalArray.joined(separator: "")
         
        return  stringFinal
        
        
         
    }
    




    }
