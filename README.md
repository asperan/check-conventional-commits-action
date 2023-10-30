# Check Conventional Commits
This action checks if all the commits of the repository follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standard.

## How to change commit messages after a push
1. Be sure you are the only one who will make the changes!
2. In your local copy of the repository, in the faulty branch, run `git rebase -i <pull-request-target>`; this will open the editor and let you view all the commits between the HEAD of the branch and the destination of the pull-request. In each faulty commit message, change the action to `edit` and the message to a conventional one; then save and quit from the editor.
3. You probably need to run `git rebase --continue`, maybe more than one time, surely until you see a message like `Successfully rebased and updated refs/heads/<faulty-branch>`.
4. If you run `git status`, it should say that your branch and the remote branch are divergent. This is ok, as you have changed messages.
5. Now you can run `git push --force-with-lease`, which should not fail (as you are the only one which changed the commits), and the pull request will be updated accordingly.

