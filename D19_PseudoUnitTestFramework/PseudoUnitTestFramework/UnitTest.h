#ifndef UNIT_TEST_FRAMEWORK_UNIT_TEST_H_
#define UNIT_TEST_FRAMEWORK_UNIT_TEST_H_

#pragma once

#include "TestCase.h"
#include <iostream>
#include <vector>

void set_std_color(int color);

// singleton class
class UnitTest
{
public:
    // Get singleton instance.
    static UnitTest *GetInstance();

    // Register testcase.
    TestCase *RegisterTestCase(TestCase *testcase);

    // Excuting testcase.
    int Run();

    TestCase *CurrentTestCase;
    int nTestResult; // the total result of the test.
    int nPassed;
    int nFailed;

protected:
    std::vector<TestCase *> testcases_; // storing testcases.
private:
    UnitTest();
    UnitTest(const UnitTest&);
    UnitTest & operator=(const UnitTest &);
};

#endif