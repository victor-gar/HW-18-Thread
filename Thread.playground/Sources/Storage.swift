import Foundation

//MARK: - Storage Thread
// Хранилище для микросхем

public class StorageThread {
    
    public init() {}
    
    private var array: [Chip] = []
    private let lock = NSLock()

    // Добавление новой микросхемы в хранилище
    func push(chip: Chip) {
        lock.lock()
        defer {
            lock.unlock()
        }
        array.append(chip)
    }
        
        // Получение микросхемы из хранилища
    func pop() -> Chip? {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.popLast()
    }
        
        // Получение количества микросхем в хранилище
    func count() -> Int {
        lock.lock()
        defer {
            lock.unlock()
        }
        return array.count
    }
}



    
  
    

    

