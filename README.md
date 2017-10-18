# Docker DevSec demo project

Demo project about automating security testing with Docker. In this case we are running the stuff with [Travis CI](https://travis-ci.org/).

Intentionally the source codes in this repository have some findings reported by the tools. Especially the Python application **is intentionally vulnerable to attacks** so do understand that running it on your own servers (as a demonstration) is a security risk!


Currently this repository demonstrates using these tools through Docker containers:

1. [OWASP Dependency Check](https://www.owasp.org/index.php/OWASP_Dependency_Check)
2. [OWASP ZAP](owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
3. [retire.js](https://retirejs.github.io/retire.js/)
4. [Find Security Bugs](http://find-sec-bugs.github.io/) (+ [FindBugs](http://findbugs.sourceforge.net/))


## Note about ZAP scanning

In the usual case scanning requires authenticating the test user with some credentials. This is not currently easy, but soon will be. See [issue at GitHub](https://github.com/Grunny/zap-cli/issues/7).


## Example log from Travis CI

For real projects, you would probably want to tune the tools to generate HTML reports or something more readable and host these documents somewhere instead of having a load of stuff within the build server log. See [sample Travis CI log](travis-log.txt) as an example. Since this is a demo, the findings are reported within the build log, which would be annoying in a real project.

Mostly this is a matter of tuning the parameters and organizing some hosting for the documents.



