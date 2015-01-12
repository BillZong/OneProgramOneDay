#ifndef UNIT_TEST_FRAMEWORK_NANCY_TEST_H_
#define UNIT_TEST_FRAMEWORK_NANCY_TEST_H_

#define TESTCASE_NAME(testcase_name) \
    testcase_name##_TEST

#define NANCY_TEST_(testcase_name) \
class TESTCASE_NAME(testcase_name) : public TestCase \
{ \
public: \
    TESTCASE_NAME(testcase_name)(const char* case_name) : TestCase(case_name){}; \
    virtual void Run(); \
private: \
    static TestCase* const testcase_; \
};\
\
TestCase* const TESTCASE_NAME(testcase_name) \
    ::testcase_ = UnitTest::GetInstance()->RegisterTestCase( \
        new TESTCASE_NAME(testcase_name)(#testcase_name)); \
void TESTCASE_NAME(testcase_name)::Run()

#define NTEST(testcase_name) \
    NANCY_TEST_(testcase_name)

#define RUN_ALL_TESTS() \
    UnitTest::GetInstance()->Run();

#define EXPECT_EQ(m, n) \
    if (m != n) \
    { \
        UnitTest::GetInstance()->CurrentTestCase->nTestResult = 0;\
        set_std_color(FOREGROUND_RED | FOREGROUND_INTENSITY);\
        std::cout << "Failed" << std::endl;\
        std::cout << "Expect:" << m << std::endl;\
        std::cout << "Actual:" << n << std::endl;\
    }

#endif