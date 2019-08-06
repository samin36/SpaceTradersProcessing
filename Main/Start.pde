class Start {

  ControlP5 cp5;
  PImage startScreen;
  PImage startBtn;
  boolean done;

  Start(PApplet applet) {
    cp5 = new ControlP5(applet);

    startScreen = loadImage("Assets/spacetrader_homescreen.png");
    startBtn = loadImage("Assets/start_new_button.png");
    startBtn.resize(200, 60);
    startScreen.resize(width, height);
    done = false;

    cp5.addButton("startBtn")
      .setPosition(95, 400)
      .setImages(startBtn, startBtn, startBtn)
      .updateSize();
  }

  void doStart() {
    if (!done) {
      startScreen();
    } else {
      cp5.remove("startBtn");
    }
  }

  void startScreen() {
    image(startScreen, 0, 0);
  }

  void controlEvent(ControlEvent event) {
    switch (event.getController().getName()) {
    case "startBtn":
      start.done = true;
      config.done = false;
      break;
    }
  }
}
