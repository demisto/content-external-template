# Getting Started   
### Creating New Repository
Press the `Use this Template` button and choose to fork the repository as private repository.

#### In case the private repository exists
```
git clone --bare https://github.com/demisto/content-external-template.git
cd content-external-template.git
git push --mirror https://github.com/yourname/private-repo.git
cd ..
rm -rf content-external-template.git
```


Clone the private repository so you can start working on it

```
git clone https://github.com/yourname/private-repo.git
cd private-repo
make some changes
git commit
git push origin master
```

### Adding xsoar-bot as a contributor
Follow [invite collaborator](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/inviting-collaborators-to-a-personal-repository) guide.  
Invite `xsoar-bot` user.

### Setup your development environment
Follow [development setup](https://xsoar.pan.dev/docs/integrations/dev-setup) article


# Adding Your Pack
### Create your first pack
Creating a pack is the same process as in the public repository. Follow the [Bofore you start](https://xsoar.pan.dev/docs/concepts/getting-started-guide#before-you-start-developing) and the [Contribution](https://xsoar.pan.dev/docs/contributing/contributing) guides that will help you to design, develop and test your work.

### Opening a Pull Request

- Make sure your work is done on a designated branch (**not Master**). This will help us conduct a proper review of the pack. 
- In your private repository [open a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) from the created branch to the Master branch. 
- When the pull request is ready for review, assign `xsoar-bot` and add the label `ready-for-review`. At this point we might ask you to invite and assign someone from the XSOAR content team members to review the pull request.

# Extras
### Update your repository
In order to sync/merge from the `content-external-template` repository from time to time.
```
cd private-repo
git remote add content-template https://github.com/demisto/content-external-template.git
git pull content-template master
git push origin master
```

**IMPORTANT: Merge the pull request only after it approved by one of XSOAR content team members.**

See example repository [content-helloworld-premium](https://github.com/demisto/content-helloworld-premium)
