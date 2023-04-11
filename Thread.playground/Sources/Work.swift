import Foundation

//MARK: - Work Thread

public class WorkThread: Thread {

    private let storage: StorageThread

    public init(storage: StorageThread) {
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
            чип был припаян. Чип в хранилище \(storage.count)
            """)
            if storage.count < 1 {
                GenerationThread.boolPredicate = false
            }
        }
    }
}

