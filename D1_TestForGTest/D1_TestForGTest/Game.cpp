#include "Game.h"

int Game::score()
{
    int gameScore = 0;
    int rollIndex = 0;
    for (int frame = 0; frame < Game::maxFrame; ++frame) {
        if (isStrike(rollIndex)) {
            gameScore += Game::maxBalls + bonusOfStrike(rollIndex);
            rollIndex++;
        } else if (isSpare(rollIndex)) {
            gameScore += Game::maxBalls + bonusOfSpare(rollIndex);
            rollIndex += 2;
        } else {
            gameScore += sumOfBallsInFrame(rollIndex);
            rollIndex += 2;
        }
    }
    return gameScore;
}
