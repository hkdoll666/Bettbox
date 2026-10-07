Future<void> handleBackOrExit() async {
  if (_ref.read(backBlockProvider)) {
    return;
  }
  // Windows: closing the window quits the app and disconnects the VPN
  // instead of hiding to tray.
  if (system.isWindows) {
    await handleExit();
    return;
  }
  if (system.isDesktop) {
    await savePreferences();
  }
  await system.back();
}
