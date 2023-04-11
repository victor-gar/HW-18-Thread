import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let storage = StorageThread()
let generatingThread = GenerationThread(storage: storage)
generatingThread.start()

let workingThread = WorkThread(storage: storage)
workingThread.start()
