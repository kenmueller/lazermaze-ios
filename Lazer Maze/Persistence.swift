import CoreData

struct Persistence {
	static let shared = Persistence()
	
	static var preview: Persistence = {
		let persistence = Persistence(inMemory: true)
		let context = persistence.context
		
		// TODO: Set default values in preview context
		
		do {
			try context.save()
		} catch {
			fatalError("Attempted to save preview context \(error)")
		}
		
		return persistence
	}()
	
	let container: NSPersistentContainer
	
	var context: NSManagedObjectContext {
		container.viewContext
	}
	
	init(inMemory: Bool = false) {
		container = .init(name: "Model")
		
		if inMemory, let store = container.persistentStoreDescriptions.first {
			store.url = .init(fileURLWithPath: "/dev/null")
		}
		
		container.viewContext.automaticallyMergesChangesFromParent = true
		
		container.loadPersistentStores { _, error in
			guard let error = error else { return }
			print("Attempted to load stores \(error)")
		}
	}
}
