#include "stdafx.h"

#include "UnitTest.h"
#include <windows.h>
//#include <iomanip>

//static void  SetConsoleColor(WORD wAttribute)
//{
//    HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
//    SetConsoleTextAttribute(handle, wAttribute);
//}
//inline std::ostream&  greencolor(std::ostream& ostr)
//{
//    SetConsoleColor(FOREGROUND_GREEN | FOREGROUND_INTENSITY);
//    return ostr;
//}
//inline std::ostream&  redcolor(std::ostream& ostr)
//{
//    SetConsoleColor(FOREGROUND_RED | FOREGROUND_INTENSITY);
//    return ostr;
//}

UnitTest * UnitTest::GetInstance()
{
    static UnitTest instance;
    return &instance;
}
UnitTest::UnitTest(void)
{
}

TestCase * UnitTest::RegisterTestCase(TestCase *testcase)
{
    testcases_.push_back(testcase);
    return testcase;
}

void set_std_color(int color) {
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);;
    SetConsoleTextAttribute(hConsole, color);
}

int UnitTest::Run()
{
    set_std_color(FOREGROUND_GREEN | FOREGROUND_INTENSITY);
    int nTestResult = 1;
    for (std::vector<TestCase *>::iterator it = testcases_.begin(); 
        it != testcases_.end(); ++it)
    {
        TestCase *testcase = *it;
        CurrentTestCase = testcase;
        //std::cout << greencolor << "=========================================" << std::endl;
        //std::cout << green << "Run TestCase: " << testcase->testcase_name << std::endl;
        std::cout << "=========================================" << std::endl;
        std::cout << "Run TestCase: " << testcase->testcase_name << std::endl;
        testcase->Run();
        std::cout << "End TestCase: " << testcase->testcase_name << std::endl;
        if (testcase->nTestResult)
        {
            nPassed++;
        }
        else
        {
            nFailed++;
            nTestResult = 0;
        }
    }

    std::cout << "=========================================" << std::endl;
    std::cout << "Total TestCase: " << nPassed + nFailed << std::endl;
    std::cout << "Passd: " << nPassed << std::endl;
    set_std_color(FOREGROUND_RED | FOREGROUND_INTENSITY);
    //std::cout << red << "Failed: " << nFailed << std::endl;
    std::cout << "Failed: " << nFailed << std::endl;

    return nTestResult;
}
