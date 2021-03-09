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

### Create your first pack
Creating a pack is the same process as in the public repository. Follow [Getting Started Guide](https://xsoar.pan.dev/docs/integrations/getting-started-guide)

### Opening a Pull Request
When you open a pull request in your private repository, when the pull request is ready for review, assign `xsoar-bot` and add the label `ready-for-review`.  
After that we will ask you to invite and assign someone from the XSOAR content team members to review the pull request.

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
