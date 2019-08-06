/**
 * The enum Good.
 */
public enum Good {
    /**
     * Water good.
     */
    WATER(30, 0, 3, 4),
    /**
     * Fur good.
     */
    FUR(250, 0, 10, 10),
    /**
     * Food good.
     */
    FOOD(100, 1, 5, 5),
    /**
     * Ore good.
     */
    ORE(350, 2, 20, 10),
    /**
     * Games good.
     */
    GAMES(250, 3, -10, 5),
    /**
     * Firearms good.
     */
    FIREARMS(1250, 3, -75, 100),
    /**
     * Medicine good.
     */
    MEDICINE(650, 4, -20, 10),
    /**
     * Machines good.
     */
    MACHINES(900, 4, -30, 5),
    /**
     * Narcotics good.
     */
    NARCOTICS(3500, 5, -125, 150),
    /**
     * Robots good.
     */
    ROBOTS(5000, 6, -150, 100);

//    /**
//     * Sets base price.
//     *
//     * @param BASE_PRICE the base price
//     */
//    public void setBASE_PRICE(double BASE_PRICE) {
//        this.BASE_PRICE = BASE_PRICE;
//    }

//    /**
//     * Sets mtlp.
//     *
//     * @param MTLP the mtlp
//     */
//    public void setMTLP(int MTLP) {
//        this.MTLP = MTLP;
//    }

//    /**
//     * Sets ipl.
//     *
//     * @param IPL the ipl
//     */
//    public void setIPL(int IPL) {
//        this.IPL = IPL;
//    }
//
//    /**
//     * Sets variance factor.
//     *
//     * @param varianceFactor the variance factor
//     */
//    public void setVarianceFactor(int varianceFactor) {
//        this.varianceFactor = varianceFactor;
//    }

    private final double BASE_PRICE;
    private final int MTLP;
    private final int IPL;
    private final int varianceFactor;

    Good(double price, int MTLP, int IPL, int varianceFactor) {
        this.BASE_PRICE = price;
        this.MTLP = MTLP;
        this.IPL = IPL;
        this.varianceFactor = varianceFactor;
    }

    /**
     * Gets base price.
     *
     * @return the base price
     */
    public double getBASE_PRICE() {
        return BASE_PRICE;
    }

    /**
     * Gets mtlp.
     *
     * @return the mtlp
     */
    public int getMTLP() {
        return MTLP;
    }

    /**
     * Gets ipl.
     *
     * @return the ipl
     */
    public int getIPL() {
        return IPL;
    }

    /**
     * Gets variance factor.
     *
     * @return the variance factor
     */
    public int getVarianceFactor() {
        return varianceFactor;
    }

    public String toString() {
        return name();
    }


}
