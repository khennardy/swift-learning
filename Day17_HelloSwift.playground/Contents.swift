import UIKit

/* closures as parameters */
let greetUser = { (name: String) -> String in
    return "Hi, \(name)!"
}

print(greetUser("Khennardy"))

func repeatAction(times: Int, action: () -> Void){
    for _ in 1...times {
        action()
    }
}
repeatAction(times: 4) {
    print("Great Job!")
}

func downloadFile(completion: () -> Void) {
    print("Downloading...")
    completion()
}

downloadFile {
    print("Done!")
}

// mini challenge //
func performTask(description :String, action: () -> Void) {
    print("Starting: \(description)")
    action()
    print( "Finished: \(description)")
}

performTask(description: "Downloading file") {
    print("Download in progress...")
}
