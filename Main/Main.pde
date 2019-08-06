import controlP5.*;
import java.util.*;
Start start;
Configuration config;
Welcome welcome;
MarketTravel marketTravel;
MarketConfig marketConfig;

Player player;


void setup() {
  size(400, 640);  
  start = new Start(this);
  config = new Configuration(this);
  welcome = new Welcome(this);
  marketTravel = new MarketTravel(this);
  marketConfig = new MarketConfig(this);
  player = new Player();
}

void draw() {
  background(0);  
  start.doStart();
  config.doConfig();
  welcome.doWelcome();
  marketTravel.doMarketTravel();
  marketConfig.doMarketConfig();
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    config.controlEvent(theEvent);
    // start.controlEvent(theEvent);
    // access the group with theEvent.getGroup()
  } else if (theEvent.isController()) {
    start.controlEvent(theEvent);
    config.controlEvent(theEvent);
    welcome.controlEvent(theEvent);
    marketConfig.controlEvent(theEvent);
    marketTravel.controlEvent(theEvent);
    // access the controller with theEvent.getController()
  }
}
