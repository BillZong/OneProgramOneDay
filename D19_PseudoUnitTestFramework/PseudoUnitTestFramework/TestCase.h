#ifndef UNIT_TEST_FRAMEWORK_TEST_CASE_H_
#define UNIT_TEST_FRAMEWORK_TEST_CASE_H_

#pragma once

class TestCase
{
public:
    TestCase(const char *case_name) : testcase_name(case_name) {}
    
    // excuting function of testcase.
    virtual void Run() = 0;
    
    int nTestResult;
    const char *testcase_name; // name of the testcase.
};

#endif
