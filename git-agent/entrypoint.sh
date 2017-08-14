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

UPSTREAM=${1:-'@{u}'}

git fetch "$UPSTREAM"

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Already up to date."
elif [ $LOCAL = $BASE ]; then
    echo "Updating..."
    git merge "$UPSTREAM"
fi

cd $OLDPWD