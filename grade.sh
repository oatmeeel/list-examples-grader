# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

cd student-submission
CPATH = ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

if [[! -f ListExamples.java]]
then
    echo "ListExamples.java does not exist"
    exit
fi

cd list-examples-grader
cp TestListExamples.java student-submission
cd student-submission

set +e

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

exit