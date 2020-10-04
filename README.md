# Getting Started   
### Creating New Repository
Presss `Use this Template` button and choose to fork the repository as private repository.

### Adding content-bot as a contributor
Follow [invite collaborator](https://help.github.jp/enterprise/2.11/user/articles/inviting-collaborators-to-a-personal-repository/) guide.  
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
git pull content-template master # Creates a merge commit
git push origin master
```

**IMPORTANT: Merge the pull request only after it approved by one of XSOAR content team members.**
 
