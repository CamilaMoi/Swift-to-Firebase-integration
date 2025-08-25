Firebase + Swift – Integrações

Repositório com exemplos e utilitários para integrar Firebase em apps iOS/macOS escritos em Swift.
Inclui configuração mínima do projeto e snippets para Analytics, Auth, Firestore, Storage e Push (FCM).

Começando

Crie um projeto no [Firebase Console], adicione o app iOS e baixe o GoogleService-Info.plist.
Coloque o .plist no target do Xcode.

Instale as dependências:
Swift Package Manager
File > Add Packages… → https://github.com/firebase/firebase-ios-sdk
Selecione: FirebaseAnalytics, FirebaseAuth, FirebaseFirestore, FirebaseStorage, FirebaseMessaging.
