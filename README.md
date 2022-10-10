# SwiftUI を Command Line Tools for Xcode だけの環境で試すメモ

Swift Package Manager は XCTest がないと動作しないので 1 ファイルだけにする  
起動は `swift main.swift`  

構成上 main attribute が使えないし、 Info.plist を埋め込むのも面倒なので AppKit で起動とかの処理をする  
`setActivationPolicy(.regular)` で独立したアプリケーション扱いにしないと、キーボード入力が Terminal とか起動元でハンドリングされてしまう  
