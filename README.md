# Deliverables

1. Set up a virtual Linux-based environment with Vagrant.
  
I am using hashicorp/bionic64 image for virtual machine

command "vagrant up" is creating, configuring and strating up my virtual machine

in vagrantfile described configuration and how to provision machine

Jenkins job configuration (via copy paste config.xml), Ansible installation and executing playbook is managed by mysetup.sh

After starting machine is ready to be used as Jenkins master. (you only need to log in and install the necessary plugins)

2. Take a Java application source code: you may want to get JSudoku or any other freeware.

Code downloaded from https://sourceforge.net/projects/jsudoku/files/jSudoku/jSudoku-1.3/jSudoku-src-1.3.tar.gz/download
  
3. Create a GitHub repository and push the source code to it.

I create 2 repositories for 2 different task solution

First solution:

In "devopstask" repository i stored both source code and all nedeed to job files. That files will be needed later to build app using git clone command powered by Jenkins. This solution doesn't match requirements that source code must be downloaded by Ant.
But it feel more convinient to me and allow other users to manage build.xml file.

https://github.com/Jcodex/devopstask

Second Soultion:

In "devopsant" repository i stored only source code.

https://github.com/Jcodex/devopsant
  
4. Prepare Apache Ant build file build.xml

build.xml consist of following targets:

  download - downloading code from repo
  
  checkstyle - checking code in all .java files
  
  compile - compiling project
  
  jar - creating jar file

5. Set up Jenkins job to build JSudoku using the build.xml build file.

I setup 2 Jenkins jobs:

"First Job" clone my git repository then invoke ant and execute consistently "checkstyle", "compile", "jar" targets
In order to invoke ant targets, build.xml was also pushed in git repository as well as checkstyle-8.29-all.jar and sun_checks.xml
 
 "Second Job" executing consistently next shell commands:
cd /home/vagrant/build2job

ant download

ant checkstyle

cp checkstyle_errors.xml /var/lib/jenkins/workspace/"Second Job"/

ant compile

ant jar
 
6. Enhance the job by adding the code testing stage with Checkstyle or PMD.

As a post-build action Jenkins publish checkstyle_errors.xml
