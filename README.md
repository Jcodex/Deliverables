# Deliverables

1.	Set up a virtual Linux-based environment with Vagrant.
  
I am using hashicorp/bionic64 image for virtual machine
command "vagrant up" is creating and strating up my virtual machine
in vagrantfile described configuration and how to provision machine
Ansible installation and executing playbook is managed by mysetup.sh 

2.	Take a Java application source code: you may want to get JSudoku or any other freeware.

Code downloaded from https://sourceforge.net/projects/jsudoku/files/jSudoku/jSudoku-1.3/jSudoku-src-1.3.tar.gz/download
  
3.	Create a GitHub repository and push the source code to it.

https://github.com/Jcodex/devopstask
  
4.	Prepare Apache Ant build file build.xml

build.xml consist of following targets:
  download - downloading code from repo
  checkstyle - checking code in all .java files
  compile - compiling project
  jar - creating jar file

5.	Set up Jenkins job to build JSudoku using the build.xml build file.

My Jenkins job clone my git repository then invoke ant and execute consistently "checkstyle", "compile", "jar" targets
In order to invoke ant targets, build.xml was also pushed in git repository as well as checkstyle-8.29-all.jar and sun_checks.xml
  
6.	Enhance the job by adding the code testing stage with Checkstyle or PMD.

As a post-build action Jenkins publish checkstyle_errors.xml
