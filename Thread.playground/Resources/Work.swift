import Foundation

//MARK: - Work Thread

public class WorkThread: Thread {
    
    private let storage: Storage

    public init(storage: Storage) {
        self.storage = storage
    }

    public override func main() {
        work()
    }

    private func work() {
        for _ in 1...10 {
            while (!GenerationThread.boolPredicate) {
                GenerationThread.condition.wait()
            }
            storage.pop().sodering()
            print("""
            \n
            Чип был припаян. Чип в хранилище \(storage.count)
            """)
            if storage.count < 1 {
                GenerationThread.boolPredicate = false
            }
        }
    }
}
