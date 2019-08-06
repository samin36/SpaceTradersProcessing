/**
 * The enum Difficulty .
 */
public enum Difficulty {
    /**
     * Beginner difficulty.
     */
    BEGINNER("Beginner"),
    /**
     * Easy difficulty.
     */
    EASY("Easy"),
    /**
     * Normal difficulty.
     */
    NORMAL("Normal"),
    /**
     * Hard difficulty.
     */
    HARD("Hard"),
    /**
     * Impossible difficulty.
     */
    IMPOSSIBLE("Impossible");

    /**
     * The Difficulty.
     */
    final String difficulty;

    Difficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    @Override
    public String toString() {
        return this.difficulty;
    }

//    public String getDifficulty() {
//        return difficulty;
//    }
//
//    public void setDifficulty(String difficulty) {
//        this.difficulty = difficulty;
//    }
}
