class MarketConfig {

  ControlP5 cp5;
  boolean done;
  ScrollableList list;
  PImage background;
  boolean changed;
  PImage buy;
  PImage sell;
  PImage back;
  Textarea credits;


  MarketConfig(PApplet applet) {
    cp5 = new ControlP5(applet);
    done = true;
    list = cp5.addScrollableList("inventory")
      .setPosition(20, 30)
      .setSize(width-40, height-100)
      .setFont(new ControlFont(createFont("Verdana", 12)))
      .setBarHeight(30)
      .setItemHeight(50)
      .addItems(Arrays.asList(""))
      .setType(ScrollableList.LIST);

    buy = loadImage("Assets/buy_bttn.png");
    buy.resize(100, 45);
    sell = loadImage("Assets/sell_bttn.png"); 
    sell.resize(100, 45);
    back = loadImage("Assets/gnat.png");
    back.resize(45, 50);

    background = loadImage("Assets/star032.png");
    background.resize(width, height);

    credits = cp5.addTextarea("credits")
      .setPosition(width/2 - 65, 0)
      .setColor(color(0, 255, 0))
      .setFont(new ControlFont(createFont("Verdana", 16)))
      .setText("");

    cp5.addButton("buy")
      .setPosition(25, height-60)
      .setImages(buy, buy, buy)
      .updateSize();

    cp5.addButton("sell")
      .setPosition(width/2 + 75, height-60)
      .setImages(sell, sell, sell)
      .updateSize();

    cp5.addButton("back")
      .setPosition(width/2-25, height-60)
      .setImages(back, back, back)
      .updateSize();

    changed = true;
  }


  void doMarketConfig() {
    if (!done) {
      marketConfig();
    } else {
      cp5.hide();
    }
  }

  void marketConfig() {
    image(background, 0, 0);
    cp5.show();

    if (changed) {
      Inventory marketInventory = getInventory("market");

      List<String> items = new ArrayList<String>();
      for (Good good : Good.values()) {
        String marketDetails = String.format("%d of %s available priced at:$%.2f", marketInventory.getStock(good), good.toString(), marketInventory.getPrice(good));
        String playerDetails = String.format("\nYou have %d of this good", getInventory("player").getStock(good));
        items.add(marketDetails+playerDetails);
      }
      list.clear();
      list.addItems(items);
      credits.setText(String.format("Credits: %.2f", player.getCredits()));
      changed = false;
    }
  }

  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
    } else {
      String clickedOn = theEvent.getController().getName();
      if (clickedOn.equals("back")) {
        done = true;
        marketTravel.done = false;
      } else {
        processGood((int) list.getValue(), clickedOn);
      }
    }
  }

  void processGood(int index, String which) {
    if (which.equals("buy")) {
      buyGood(index);
      println("buy" + frameCount);
    } else if (which.equals("sell")) {
      sellGood(index);
      println("sell" + frameCount);
    }
  }

  Inventory getInventory(String whose) {
    if (whose.equals("market")) {
      return player.getLocation().getMarket().getMarketInventory();
    } else {
      return player.getInventory();
    }
  }

  private void sellGood(int pos) {
    Good selling = Good.values()[pos];
    Market market = player.getLocation().getMarket();
    double goodPrice = market.getPriceOfGood(selling);

    if (player.getStock(selling) <= 0 || player.getTotalStock() <= 0) {
      println("You cannot sell more goods than you own");
    } else {
      player.setCredits(player.getCredits() + goodPrice);
      player.setStock(selling, player.getStock(selling) - 1);
      player.adjustTotalStock(player.getTotalStock() - 1);

      market.setStock(selling, market.getStock(selling) + 1);
      market.adjustTotalStock(market.getTotalStock() + 1);
      changed = true;
    }
  }


  private void buyGood(int pos) {
    Good buying = Good.values()[pos];
    Market market = player.getLocation().getMarket();
    double goodPrice = market.getPriceOfGood(buying);

    if (market.getStock(buying) <= 0) {
      println("cannot buy because market does not have enough of the good");
    } else if (player.getCredits() < goodPrice) {
      println("you do not have enough money to buy this good");
    } else {
      player.setCredits(player.getCredits() - goodPrice);
      player.setStock(buying, player.getStock(buying) + 1);
      player.adjustTotalStock(player.getTotalStock() + 1);

      market.setStock(buying, market.getStock(buying) - 1);
      market.adjustTotalStock(market.getTotalStock() - 1);
      changed = true;
    }
  }
}
