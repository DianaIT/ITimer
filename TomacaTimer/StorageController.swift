import Foundation

struct Work: Hashable, Encodable, Decodable {
    let task: String
    let date: Date
    var time: Int
}

struct WorkString: Hashable, Encodable, Decodable {
    let task: String
    let date: String
    var time: String
}

class StorageController {
    var workList: [Work] = []
    
    init(){
        self.workList = get()
    }
    
    func save(workList: [Work]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(workList)
            UserDefaults.standard.set(data, forKey: "workList")
            }
        catch {
            print("Unable to Encode Score Array (\(error))")
        }
    }

    func get() -> [Work] {
        var workList: [Work] = []
        if let data = UserDefaults.standard.data(forKey: "workList") {
            do {
                let decoder = JSONDecoder()
                workList = try decoder.decode([Work].self, from: data)
                return workList
            } catch {
                print("Unable to Decode Score Array (\(error))")
            }
        }
        return workList
    }
    
}