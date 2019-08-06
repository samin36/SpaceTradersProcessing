class Configuration {

  ControlP5 cp5;
  PImage configScreen;
  PImage configPlayer;
  boolean done;

  RadioButton r1;   
  Controller name;
  Knob f, p, t, e;
  Button setup;

  Configuration(PApplet applet) {
    cp5 = new ControlP5(applet);

    configScreen = loadImage("Assets/player_config_scrn.png");
    configPlayer = loadImage("Assets/start_bttn.png");
    configPlayer.resize(120, 70);

    configScreen.resize(width, height);
    done = true;

    name = cp5.addTextfield("Name")
      .setPosition(100, 150)
      .setSize(200, 20)
      .setFocus(true)
      .setAutoClear(false)
      .setColor(color(255));

    f = cp5.addKnob("Fighter")
      .setRange(0, 16)
      .setValue(0)
      .setPosition(100, 200)
      .setRadius(25)
      .setNumberOfTickMarks(16)
      .setTickMarkLength(4)
      .snapToTickMarks(true)
      .setColorForeground(color(255))
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(255, 255, 0))
      .setViewStyle(Knob.ARC)
      .setDragDirection(Knob.HORIZONTAL)
      ;
    p = cp5.addKnob("Pilot")
      .setRange(0, 16)
      .setValue(0)
      .setPosition(240, 200)
      .setRadius(25)
      .setNumberOfTickMarks(16)
      .setTickMarkLength(4)
      .snapToTickMarks(true)
      .setColorForeground(color(255))
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(255, 255, 0))
      .setViewStyle(Knob.ARC)
      .setDragDirection(Knob.HORIZONTAL)
      ;
    t = cp5.addKnob("Trader")
      .setRange(0, 16)
      .setValue(0)
      .setPosition(100, 275)
      .setRadius(25)
      .setNumberOfTickMarks(16)
      .setTickMarkLength(4)
      .snapToTickMarks(true)
      .setColorForeground(color(255))
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(255, 255, 0))
      .setViewStyle(Knob.ARC)
      .setDragDirection(Knob.HORIZONTAL)
      ;
    e = cp5.addKnob("Engineer")
      .setRange(0, 16)
      .setValue(0)
      .setPosition(240, 275)
      .setRadius(25)
      .setNumberOfTickMarks(16)
      .setTickMarkLength(4)
      .snapToTickMarks(true)
      .setColorForeground(color(255))
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(255, 255, 0))
      .setViewStyle(Knob.ARC)
      .setDragDirection(Knob.HORIZONTAL)
      ;

    r1 = cp5.addRadioButton("difficulty")
      .setPosition(180, 370)
      .setSize(40, 20)
      .setColorForeground(color(120))
      .setColorActive(color(255, 0, 0))
      .setColorLabel(color(0))
      .setItemsPerRow(1)
      .addItem("Beginner", 1)
      .addItem("Easy", 2)
      .addItem("Normal", 3)
      .addItem("Hard", 4)
      .addItem("Impossible", 5);

    setup = cp5.addButton("setPlayer")
      .setPosition(140, 475)
      .setImages(configPlayer, configPlayer, configPlayer)
      .updateSize();

    //for (Toggle t : r1.getItems()) {
    //  t.getCaptionLabel().setColorBackground(color(255, 80));
    //  t.getCaptionLabel().getStyle().moveMargin(-7, 0, 0, -3);
    //  t.getCaptionLabel().getStyle().movePadding(7, 0, 0, 3);
    //  t.getCaptionLabel().getStyle().backgroundWidth = 45;
    //  t.getCaptionLabel().getStyle().backgroundHeight = 13;
    //}
  }

  void doConfig() {
    if (!done) {
      configScreen();
    } else {
      cp5.hide();
    }
  }

  void configScreen() {
    image(configScreen, 0, 0);
    cp5.show();
  }

  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
      player.setPreferredDifficulty(Difficulty.values()[(int) (r1.getValue()-1)]);
    } else {
      switch (theEvent.getController().getName()) {
      case "setPlayer": 
        String pName = cp5.get(Textfield.class, "Name").getText();
        if (!pName.isEmpty()) {
          player.setName(pName);
          Skills[] skills = Skills.values();
          skills[0].setPoints((int)p.getValue());
          skills[1].setPoints((int)f.getValue());
          skills[2].setPoints((int)t.getValue());
          skills[3].setPoints((int)e.getValue());
          player.setLocation(Universe.getRandomPlanet());
          int sum = validatePoints(skills);
          if (sum <= Skills.MAX_POINTS) {
            player.setSkills(skills);
            println(player);
            done = true;
            welcome.done = false;
            break;
          } else {
            skills = null;
            println("Current Points: " + sum + " cannot be greater than 16");
          }
        } else {
          println("Player name cannot be empty");
        }
      }
    }
  }

  private int validatePoints(Skills[] skills) {
    int sum = 0;
    for (int i = 0; i < skills.length; i++) {
      sum += skills[i].getPoints();
    }
    return sum;
  }
}
