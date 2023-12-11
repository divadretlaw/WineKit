# WineKit

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdivadretlaw%2FWineKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/divadretlaw/WineKit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdivadretlaw%2FWineKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/divadretlaw/WineKit)

Run Wine from Swift

## Usage

### Wine

```swift
let folder: URL = "/path/to/wine/bin"
let bottle: URL = "/path/to/bottle"
let wine = Wine(folder: folder, bottle: bottle)
```

#### Registry

Query the registry for an entry

```swift
try await wine.registry.query(
    keyPath: String,
    name: String,
    type: RegistryType
)
```

Add an entry to the registry

```swift
try await wine.registry.add(
    keyPath: String,
    name: String,
    value: String,
    type: RegistryType
)
```

Delete an entry from the registry

```swift
try await wine.registry.delete(
    keyPath: String,
    name: String
)
```

##### Registry

Open the Registry Editor

```swift
try await wine.commands.registryEditor()
```

#### Commands

Open the GUI configuration tool for Wine

```swift
try await wine.commands.configurationGUI()
```

Open the Wine Control Panel

```swift
try await wine.commands.controlPanel()
```

##### Task Manager

Open the Wine Task Manager

```swift
try await wine.commands.taskManager()
```

### `WindowsFileKit`

Parse windows files

#### Portable Executable

For more information see [PE Format](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format) on *Microsoft Learn*.

```swift
let url: URL = "/path/to/peFile"
let peFile = PortableExecutable(url: url)
```

#### Shell Link

For more information see [Shell Link](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/) on *Microsoft Learn*.

```swift
let url: URL = "/path/to/shellLink"
let shellLink = ShellLink(url: url)
```

## License

See [LICENSE](LICENSE)
