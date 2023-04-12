import Foundation

//MARK: - Work Thread
// Рабочий поток

public class WorkThread: Thread {
    
    let storage: StorageThread
    
    public init(storage: StorageThread) {
        self.storage = storage
    }
    
    public override func main() {
        while true {
            if let chip = storage.pop() {
                print("WorkThread: Got chip \(chip.chipType)")
                chip.sodering()
                print("WorkThread: Soldered chip \(chip.chipType)")
            } else {
                // Если в хранилище нет микросхем, ждем 1 секунду и пытаемся получить их снова
                WorkThread.sleep(forTimeInterval: 1)
            }
        }
    }
}

