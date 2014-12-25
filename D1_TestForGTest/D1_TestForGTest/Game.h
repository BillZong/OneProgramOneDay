#ifndef __GAME_H__
#define __GAME_H__

class Game
{
public:
    Game(): currentRoll(0) {
        for (int i = 0; i < (sizeof(rolls) / sizeof(int)); ++i) {
            rolls[i] = 0;
        }
    }

    // balls hit in this roll.
    void roll(int pin) { rolls[currentRoll++] = pin; }

    // this function shouldn't be called before the game end.
    int score();

public:
    static const int maxFrame = 10;
    static const int maxBalls = 10;
    
private:
    int rolls[21]; // holding the balls hit by each roll.
    int currentRoll;

private:
    // if the frame got spare, return true. Remenber to move 2 rollIndex.
    bool isSpare(int rollIndex) {
        return rolls[rollIndex] + rolls[rollIndex + 1] == Game::maxBalls;
    }

    // if the frame got strike, return true. Remenber to move 1 rollIndex.
    bool isStrike(int rollIndex) {
        return rolls[rollIndex] == Game::maxBalls;
    }

    // we got bonus here for strike, need to add the balls hit in this frame.
    // That is Game::maxBalls.
    int bonusOfStrike(int rollIndex) {
        return rolls[rollIndex + 1] + rolls[rollIndex + 2];
    }

    // we got bonus here for spare, need to add the balls hit in this frame.
    // That is Game::maxBalls.
    int bonusOfSpare(int rollIndex) {
        return rolls[rollIndex + 2];
    }

    int sumOfBallsInFrame(int rollIndex) {
        return rolls[rollIndex] + rolls[rollIndex + 1];
    }
};

#endif
