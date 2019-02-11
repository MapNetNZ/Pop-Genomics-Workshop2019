# Building a MAPGD Singularity Image

- on osx
- converted Dockerfile to definition file using python API
```
pip3 install spython
spython recipe Dockerfile  > PopGen_Singularity.def
```
- Using Hashicorp Vagrant VM definition https://app.vagrantup.com/sylabs/boxes/singularity-3.0-ubuntu-bionic64
```
vagrant init sylabs/singularity-3.0-ubuntu-bionic64
vagrant up
vagrant ssh
```
- inside VM

```
sudo singularity  build --sandbox PopGen_Singularity.sif /POP_data/PopGen_Singularity.def
singularity shell PopGen_Singularity.sif
```
