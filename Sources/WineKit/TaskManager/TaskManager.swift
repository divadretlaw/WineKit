//
//  TaskManager.swift
//  WineKit
//
//  Created by David Walter on 09.11.23.
//

import Foundation

public final class TaskManager: ObservableObject {
    public static let shared = TaskManager()
    
    @Published public private(set) var userTasks: Set<WineProcess>
    @Published public private(set) var systemTasks: Set<WineProcess>
    
    private let lock: NSLock
    
    private init() {
        self.userTasks = []
        self.systemTasks = []
        self.lock = NSLock()
    }
    
    public func task(for portableExecutable: PortableExecutable?) -> WineProcess? {
        guard let portableExecutable else { return nil }
        
        if let task = userTasks.first(where: { $0.portableExecutable == portableExecutable }) {
            return task
        }
        
        if let task = systemTasks.first(where: { $0.portableExecutable == portableExecutable }) {
            return task
        }
        
        return nil
    }
    
    public func tasks(for portableExecutable: PortableExecutable?) -> [WineProcess] {
        var tasks: [WineProcess] = []
        
        guard let portableExecutable else { return [] }
        
        tasks.append(contentsOf: userTasks.filter { $0.portableExecutable == portableExecutable })
        tasks.append(contentsOf: systemTasks.filter { $0.portableExecutable == portableExecutable })
        
        return tasks
    }
    
    func runUser(_ process: WineProcess) -> AsyncStream<WineOutput> {
        defer {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                lock.withLock {
                    _ = self.userTasks.insert(process)
                }
            }
        }
        return process.run()
    }
    
    func runSystem(_ process: WineProcess) -> AsyncStream<WineOutput> {
        defer {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                lock.withLock {
                    _ = self.systemTasks.insert(process)
                }
            }
        }
        return process.run()
    }
    
    func remove(_ process: WineProcess) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            lock.withLock {
                self.userTasks.remove(process)
                self.systemTasks.remove(process)
            }
        }
    }
}
