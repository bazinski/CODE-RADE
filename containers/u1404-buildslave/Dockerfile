# Ubuntu build slave container for CODE-RADE

# basic metadata
MAINTAINER Bruce Becker <bbecker@Csir.co.za>
FROM ansible/ubuntu14.04-ansible

CMD apt-get  install -y libffi-dev
# get AAROC DevOps code
CMD git clone https://github.com/AAROC/DevOps
WORKDIR DevOps/Ansible


# become a jenkins slave with CVMFS
CMD ansible -c local code-rade-slave.yml
