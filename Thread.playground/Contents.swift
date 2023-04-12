import Foundation
import PlaygroundSupport

let storage = StorageThread()
let generatingThread = GenerationThread(storage: storage)
generatingThread.start()

let workingThread = WorkThread(storage: storage)
workingThread.start()

PlaygroundPage.current.needsIndefiniteExecution = true

