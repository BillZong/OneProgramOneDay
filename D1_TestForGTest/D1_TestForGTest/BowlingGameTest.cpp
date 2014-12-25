#include "Game.h"
#include "gtest/gtest.h"

// Look at the gtest samples 3, there is test fixture 
// setting and testing!
// And you'd better look up the gtest.h for more imformation.
class BowlingGameTest: public testing::Test {
protected:
    Game *g;

    virtual void SetUp() {
        g = new Game();
    }

    virtual void TearDown() {
        delete g;
        g = NULL;
    }

    void rollMany(int n, int pin) {
        for (int i = 0; i < n; ++i) {
            g->roll(pin);
        }
    }

    void rollSpare() {
        g->roll(5);
        g->roll(Game::maxBalls - 5);
    }

    void rollStrike() {
        g->roll(Game::maxBalls);
    }
};

TEST_F(BowlingGameTest, testGutterGame)
{
    rollMany(20, 0);
    EXPECT_EQ(0, g->score());
}

TEST_F(BowlingGameTest, testAllOnes)
{
    rollMany(20, 1);
    EXPECT_EQ(20, g->score());
}

TEST_F(BowlingGameTest, testOneSpare) {
    rollSpare();
    g->roll(7); 
    rollMany(17, 0);
    EXPECT_EQ(24, g->score());
}

TEST_F(BowlingGameTest, testOneStrike) {
    rollStrike();
    g->roll(7);
    g->roll(2);
    EXPECT_EQ(28, g->score());
}

TEST_F(BowlingGameTest, testPerfect) {
    rollMany(12, Game::maxBalls);
    EXPECT_EQ(300, g->score());
}