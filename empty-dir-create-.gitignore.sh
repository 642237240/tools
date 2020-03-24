#find empty directionary and create a file .gitignore
find . -type d -empty -exec touch {}/.gitignore \;
