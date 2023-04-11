import Foundation

//MARK: - Generation Thread

public class GenerationThread: Thread {
    static let condition = NSCondition()
    static var boolPredicate = false
    private let storage: Storage
    
    public init(storage: Storage) {
        self.storage = storage
    }
    
    public override func main() {
        make()
    }
    
    private func make() {
        for _ in 1...10 {
            GenerationThread.condition.lock()
            storage.push(newElement: Chip.make())
            GenerationThread.boolPredicate = true
            print("""
               \n
               Чип создан! Чип в хранилище: \(storage.count)
               """)
            GenerationThread.condition.signal()
            GenerationThread.condition.unlock()
            GenerationThread.sleep(forTimeInterval: 2)
        }
    }
}
