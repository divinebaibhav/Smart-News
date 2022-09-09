# 1  NEWS API URL

URL - https://newsapi.org/v2/top-headlines?country=us&apiKey=<APIKey>

GET https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=<APIKey>



# 2  To change status bar 

step 1 - Project - > Target -> general -> status bar style -> make it 'Light'
step 2 - in info.plist add key 'View controller-based status bar appearance' and put value to NO


# 3 To solve error on push to gitHub
Error is:
! [rejected]        dev -> dev (non-fast-forward)
error: failed to push some refs to 'https://github.com/divinebaibhav/SmartNews.git'

Solution: 
git push -f -u origin dev

# 4 Git mergetool generates unwanted .orig files

git config --global mergetool.keepBackup false

After performing a merge, the original file with conflict markers can be saved as a file with a .orig extension.
If this variable is set to false then this file is not preserved.
Defaults to true (i.e. keep the backup files)

//
However, we can use an exclude pattern and negate the match. Preview with this command:

git clean -e '!*.orig' --dry-run
Then when you're confident, pass the force flag to really delete them:

git clean -e '!*.orig' -f

