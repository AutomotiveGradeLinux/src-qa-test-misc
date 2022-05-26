import pytest
import subprocess

import plugins.agl_test_utils as agl_test_utils

from plugins.agl_test_base import AGLBaseTest
class RPMBase(AGLBaseTest):
    def __init__(self):
        super().__init__(name="rpm")

    def run_case(self, case_id):
        case_info = self.get_caseinfo_by_name(case_id)
        if (case_info[1] == "TEST-PASS"):
            case_info[2] = "passed"
        else:
            case_info[2] == "failed"
        self.update_caseinfo_by_name(case_id, case_info)
        assert case_info[2] == "passed"

    #Run test, and redirect the log into the file of rpm.log
    def run_test_fun(self):
        log_file = self.get_logfile()
        cwd = self.get_workdir()
        with open(log_file,'w') as log_f:
            subprocess.run(['sh','rpm_test.sh'],cwd=cwd,stdout=log_f,stderr=log_f)
        log_f.close()

@pytest.fixture(scope='module')
def testbase():
    #init instance for test
    instance = RPMBase()
    #run test scripts
    instance.run_test_fun()
    #parser log
    instance.log_process()

    yield instance

    #package log files and make report file
    instance.log_report()

def setup_module(testbase: RPMBase):
    agl_test_utils.find_cmd("rpm")

@pytest.mark.oss_default
def test_rpm01(testbase: RPMBase):
    name = "rpm01"
    testbase.run_case(name)

@pytest.mark.oss_default
def test_rpm02(testbase: RPMBase):
    name = "rpm02"
    testbase.run_case(name)

@pytest.mark.oss_default
def test_rpm03(testbase: RPMBase):
    name = "rpm03"
    testbase.run_case(name)

if __name__ == '__main__':
    pytest.main("-s run_tests")
