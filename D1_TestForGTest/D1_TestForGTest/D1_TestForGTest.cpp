// D1_TestForGTest.cpp : �������̨Ӧ�ó������ڵ㡣
//

#include <iostream>
#include "gtest/gtest.h"
#include "Game.h"

int main(int argc, char** argv)
{ 
    testing::InitGoogleTest(&argc, argv); 
    RUN_ALL_TESTS();

    std::getchar();// keep console window open until Return keystroke

    return 0;
}
