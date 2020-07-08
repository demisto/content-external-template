# Getting Started   
### Creating New Repository
Create new private repository using [Github.UI](https://github.com/new)
```
git clone --bare https://github.com/demisto/content-external-template.git
cd content
git push --mirror https://github.com/yourname/private-repo.git
cd ..
rm -rf content-external-template
```


Clone the private repository so you can start working on it

```
git clone https://github.com/yourname/private-repo.git
cd private-repo
make some changes
git commit
git push origin master
```

In order to sync from the `content-external-template` repository from time to time.
```
cd private-repo
git remote add content-template https://github.com/demisto/content-external-template.git
git pull content-template master # Creates a merge commit
git push origin master
```

### Adding content-bot as a contributor
Follow [invite collaborator](https://help.github.jp/enterprise/2.11/user/articles/inviting-collaborators-to-a-personal-repository/) guide.  
Invite `xsoar-bot` user.

### Setup your development environment
Then follow [development setup](https://xsoar.pan.dev/docs/integrations/dev-setup) article
 
