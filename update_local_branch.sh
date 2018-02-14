CURRENT_BRANCH=`git branch | grep \* | cut -d ' ' -f2-`
echo "Current Branch: ${CURRENT_BRANCH}"

echo "\nChecking out master..."
git checkout master

echo "\nFetching..."
git fetch 

echo "\nPulling..."
git pull

echo "\nSwitching back to current branch (${CURRENT_BRANCH})..."
git checkout $CURRENT_BRANCH

#TODO: add interactive rebasing conditionally

echo "\nRebasing..."
git rebase origin/master
