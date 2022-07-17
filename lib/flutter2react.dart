import 'dart:io';

void run(String command) {
  String path = "flutter/";
  if (command == "init") {
    _init(path);
  } else if (command == "build") {
    _build(command);
  } else if (command == "clean") {
    _clean();
  } else {
    print("Options [$command] Not Found!");
  }
}

void _init(String path) async {
  if (Directory("./reactjs/").existsSync()) {
    print("Already Initialized.");
    print("Please first run - flutter2react clean ");
    return;
  } else {
    print("Initialization ...");
    Directory("./reactjs/").createSync(recursive: true);
    print("reactjs - Folder Created");
    Directory("./reactjs/components").createSync(recursive: true);
    print("reactjs/components - Folder Created");
    print("Installing Reactjs ..");
  }
  var result =
      await Process.start("npx", ["create-react-app", "reactjs/reactapp"]);
/*
  await stdout.addStream(result.stdout);
  await stdout.addStream(result.stderr);*/
  var exitCode = await result.exitCode;
  if (exitCode == 0) {
    print("Sucessfully Initialized :)");
  } else {
    print("Failed To Initialized :(");
  }
}

void _build(String path) {
  if (Directory("./reactjs").existsSync()) {
    print("Please initialize this project first :(");
    return;
  }
  print("Compiling to reactjs ...");
}

void _clean() async {
  print("Cleaning project ...");

  var result = await Process.start("rm", ["-rf", "reactjs"]);
  final code = await result.exitCode;
  if (code == 0) {
    print("Successfully cleaned. :)");
  } else {
    print("Failed to Delete :(");
  }
}
