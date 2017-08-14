#!/bin/sh

echo "machine $GIT_HOST" > ~/.netrc
echo "login $GIT_USERNAME" >> ~/.netrc
echo "login `cat /run/secrets/git-pwd`" >> ~/.netrc
chmod 600 ~/.netrc

if [ ! -d "$GIT_PATH/.git" ]; then
    echo "Git repository doesn't exist, will clone to local."
    git clone $GIT_URL $GIT_PATH
else
    echo "Git repository exists, will check synchronization status."
fi

cd $GIT_PATH

BRANCH=$(git name-rev --name-only HEAD)
REMOTE=$(git config branch.$BRANCH.remote)

git fetch "$REMOTE"

VERSION_LOCAL=$(git rev-parse @)
VERSION_REMOTE=$(git rev-parse "$REMOTE")
VERSION_BASE=$(git merge-base @ "$REMOTE")

if [ $VERSION_LOCAL = $VERSION_REMOTE ]; then
    echo "Already up to date."
elif [ $VERSION_LOCAL = $VERSION_BASE ]; then
    echo "Updating..."
    git merge "$REMOTE/$BRANCH"
fi

cd $OLDPWD