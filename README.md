# Deliverables

1. Set up a virtual Linux-based environment with Vagrant.
  
I am using hashicorp/bionic64 image for virtual machine

command "vagrant up" is creating configuring and  then strating up my virtual machine

in vagrantfile described configuration and how to provision machine

Jenkins configuration (via copy paste pre configured Jenkins), Ansible installation and executing playbook is managed by mysetup.sh. 

In order to work vagrant directory should have: 

manualy configured "jenkins" directory

build.xml - ant configuration

play.yaml - ansible playbook

checkstyle-8.29-all.jar and sun_checks.xml - checkstyle dependencies

After machine is started up, it's ready to work as Jenkins master with 2 jobs online.

2. Take a Java application source code: you may want to get JSudoku or any other freeware.

Code downloaded from https://sourceforge.net/projects/jsudoku/files/jSudoku/jSudoku-1.3/jSudoku-src-1.3.tar.gz/download
  
3. Create a GitHub repository and push the source code to it.

I created 2 GitHub repositories to provide 2 solutions for the task

First Solution:

https://github.com/Jcodex/devopstask

I pushed both source code and all needed to Jenkins job and ant files in "devopstask, in order to git clone it later with Jenkins and build the app. It's doesn't match requirement which says that source code must be downloaded by ant, but its feels more convinient to me and also provide build.xml file to other users.

Second Solution

https://github.com/Jcodex/devopsant

I pushed only source code to "devopsant" repository, it will be used as a source for ant "download" target
  
4. Prepare Apache Ant build file build.xml

build.xml consist of following targets:

  download - downloading code from repo
  
  checkstyle - checking code in all .java files
  
  compile - compiling project
  
  jar - creating jar file

5. Set up Jenkins job to build JSudoku using the build.xml build file.

"First Job" clone my git repository then invoke ant and execute consistently "checkstyle", "compile", "jar" targets
In order to invoke ant targets, build.xml was also pushed in git repository as well as checkstyle-8.29-all.jar and sun_checks.xml

"Second Job" execute consistently following shell commands

cd /home/vagrant/build2job

ant download

ant checkstyle

cp checkstyle_errors.xml /var/lib/jenkins/workspace/"Second Job"/

ant compile

ant jar
  
6. Enhance the job by adding the code testing stage with Checkstyle or PMD.

As a post-build action Jenkins publish checkstyle_errors.xml
