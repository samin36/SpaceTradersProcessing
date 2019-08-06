import java.util.Collections;
import java.util.HashSet;
import java.util.Objects;
import java.util.Random;
import java.util.Set;

import static java.lang.Math.floor;

/**
 * The type Solar system.
 */
public class SolarSystem {

    private final String name;
    private final double xLoc;
    private final double yLoc;
    private final Set<Planet> planets;
    private static final int NUM_PLANETS = ((int) (Math.random() * 7)) + 4;

    /**
     * Instantiates a new Solar system.
     *
     * @param name the name
     */
    public SolarSystem(String name) {
        this.name = name;
        planets = new HashSet<>();
        for (int i = 0; i < NUM_PLANETS; i++) {
            Random rand = new Random();
            int randInt = rand.nextInt(GameLogistics.PLANET_NAMES.length);
            Planet planet = new Planet(GameLogistics.PLANET_NAMES[randInt]);
            planet.setSolarSystemCurrentlyIn(name);
            planets.add(planet);
        }

        Random rand = new Random();
        xLoc = floor(rand.nextDouble() * GameLogistics.MAX_WIDTH);
        yLoc = floor(rand.nextDouble() * GameLogistics.MAX_HEIGHT);
    }

    /**
     * Gets planets.
     *
     * @return the planets
     */
    public Set<Planet> getPlanets() {
        return Collections.unmodifiableSet(planets);
    }

    public Planet getRandomPlanet() {
        Random rand = new Random();
        int randIndex = rand.nextInt(planets.size());
        return (Planet) Objects.requireNonNull(planets.toArray())[randIndex];
    }

    public static Planet getPlanetByName(SolarSystem solar, String planetName) {
        SolarSystem solarSys = Objects.requireNonNull(solar);
        for (Planet current : solarSys.getPlanets()) {
            if (planetName.equals(current.getName())) {
                return current;
            }
        }
        return null;
    }

//    /**
//     * Sets planets.
//     *
//     * @param planets the planets
//     */
//    public void setPlanets(Set<Planet> planets) {
//        this.planets = planets;
//    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("\nSolar System: ");
        stringBuilder.append(name);
        stringBuilder.append(String.format("\nLocation: (%.0f, %.0f)", xLoc, yLoc));
        for (Planet curr : planets) {
            stringBuilder.append("\n\t");
            stringBuilder.append(curr.toString());
        }
        return stringBuilder.toString();
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if ((o == null) || (getClass() != o.getClass())) {
            return false;
        }
        SolarSystem that = (SolarSystem) o;
        return (Double.compare(that.xLoc, xLoc) == 0) && (Double.compare(that.yLoc, yLoc) == 0)
               && Objects.equals(name, that.name) && Objects.equals(planets, that.planets);
    }

//    public static int getNumPlanets() {
//        return NUM_PLANETS;
//    }

    public String getName() {
        return name;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, xLoc, yLoc, planets);
    }
}
