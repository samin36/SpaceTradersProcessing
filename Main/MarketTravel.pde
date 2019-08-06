class MarketTravel {

  ControlP5 cp5;
  PImage background;
  PImage planet;
  PImage ship;
  PImage marketBtn;
  PImage travelBtn;
  boolean done;
  float yVel;

  Textarea location;
  Textarea credits;
  Textarea fuelLevel;

  MarketTravel(PApplet applet) {
    cp5 = new ControlP5(applet);

    background = loadImage("Assets/star032.png");
    background.resize(width, height);
    planet = loadImage("Assets/red_planet.png");
    planet.resize(width, 400);
    ship = loadImage("Assets/gnat.png");
    ship.resize(200, 300);
    marketBtn = loadImage("Assets/market_bttn.png");
    marketBtn.resize(100, 100);
    travelBtn = loadImage("Assets/travel_bttn.png");
    travelBtn.resize(100, 100);

    cp5.addButton("marketButton")
      .setPosition(30, 115)
      .setImages(marketBtn, marketBtn, marketBtn)
      .updateSize();

    cp5.addButton("travelButton")
      .setPosition(280, 115)
      .setImages(travelBtn, travelBtn, travelBtn)
      .updateSize();

    location = cp5.addTextarea("location")
      .setText("") 
      .setFont(new ControlFont(createFont("Verdana", 16)))
      .setColor(color(255, 255, 0))
      .setPosition(20, 50);


    credits = cp5.addTextarea("credits")
      .setText("") 
      .setFont(new ControlFont(createFont("Verdana", 16)))
      .setColor(color(255, 255, 0))
      .setPosition(width/2+50, 50);

    fuelLevel = cp5.addTextarea("fuel")
      .setText("") 
      .setFont(new ControlFont(createFont("Verdana", 16)))
      .setColor(color(255, 255, 0))
      .setPosition(width/2-10, height/2);

    done = true;
    yVel = 0;
  }

  void doMarketTravel() {
    if (!done) {
      marketTravel();
      location.setText(String.format("Location: %s", player.getLocation().getName()));
      credits.setText(String.format("Credits: %.1f", player.getCredits()));
    } else {
      cp5.hide();
    }
  }

  void marketTravel() {
    image(background, 0, 0);
    image(planet, 0, height-planet.height);
    image(ship, width/4, -ship.height+yVel);

    cp5.show();
    if (-ship.height+yVel <= 250) {
      yVel+=3;
    } else {
      fuelLevel.setText(String.valueOf(player.getShipFuelCapacity()));
    }
  }

  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
    } else {
      switch(theEvent.getController().getName()) {
      case "marketButton":
        //Inventory marketInventory = player.getLocation().getMarket().getMarketInventory();
        //println(marketInventory.getInventory());
        done = true;
        marketConfig.done = false;
        println("Yes");
        break;
      case "travelButton":
        println(Universe.getInstance().toString());
        break;
      }
    }
  }
}
