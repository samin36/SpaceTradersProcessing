class Welcome {

  ControlP5 cp5;
  PImage welcomePlayer;
  boolean done;
  Textarea msg;
  

  Welcome(PApplet applet) {
    cp5 = new ControlP5(applet);

    welcomePlayer = loadImage("Assets/star.gif");
    welcomePlayer.resize(width, height);
    done = true;

    PImage[] imgs = {loadImage("Assets/continue_bttn.png"), loadImage("Assets/continue_bttn.png"), loadImage("Assets/continue_bttn.png")};

    cp5.addButton("Continue")
      .setImages(imgs)
      .setPosition(85, 425)
      .updateSize();

    msg = cp5.addTextarea("welcomeMessage")
      .setText("sdf")
      .setPosition(100, 225)
      .setColorValue(0xffffff00)
      .setFont(createFont("Georgia", 20))
      .setWidth(width/2)
      .setHeight(200);
  }

  void doWelcome() {
    if (!done) {
      welcomeScreen();
      String welcomeMessage = String.format("\"Welcome %s%n We are excited you have decided to begin your journey with us\"", player.getName());
      msg.setHeight((int) map(mouseX, 0, width, 0, 400));
      msg.setText(welcomeMessage);
    } else {
      cp5.hide();
    }
  }

  void welcomeScreen() {
    image(welcomePlayer, 0, 0);
    cp5.show();
  }     

  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
    } else {
      switch (theEvent.getController().getName()) {
         case "Continue":
           done = true;
           marketTravel.done = false;
         break;
      }
    }
  }
}
