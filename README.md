# ci
> continuous integration with jenkins using publish over ssh plugin

# Make it work
 * start jenkins, create admin user, install suggested plugins (if you have my jenkins_home.tar you don't have to do this)  
 * install publish over ssh plugin in jenkins
 * create user `teamgreen` in your servers
 * create ssh keys in your jenkins servers
 * add your jenkins public keys to your server `/home/teamgreen/.ssh/authorized_keys`

# Backup your jenkins_home
 ```bash
  docker run --rm --volumes-from data-container-jenkins -v $(pwd):/backup ubuntu tar cvf /backup/jenkins_home.tar /var/jenkins_home
  # you do n't need to install any thing, just extract jenkins_home.tar to ./data folder to be like ./data/jenkins_home
 ```

# resources
 * [running ssh service in docker container](https://docs.docker.com/engine/examples/running_ssh_service/)
