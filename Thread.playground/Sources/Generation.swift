import Foundation

//MARK: - Generation Thread
// Генерирующий поток

public class GenerationThread: Thread {
    
    let storage: StorageThread
    
    public init(storage: StorageThread) {
        self.storage = storage
    }
    
    public override func main() {
        let endTime = Date().addingTimeInterval(20)
        while Date() < endTime {
            let chip = Chip.make()
            storage.push(chip: chip)
            print("GenerationThread: Added new chip \(chip.chipType)")
            GenerationThread.sleep(forTimeInterval: 2)
        }
    }
}




