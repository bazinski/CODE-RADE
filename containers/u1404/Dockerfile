# Ubuntu build slave container for CODE-RADE

# basic metadata
FROM  ansible/ubuntu1404-ansible
MAINTAINER "Bruce Becker <bbecker@Csir.co.za>"

# get AAROC DevOps code

CMD git clone https://github.com/AAROC/DevOps
WORKDIR DevOps/Ansible


# become a jenkins slave with CVMFS
CMD ansible -c local code-rade-slave.yml
