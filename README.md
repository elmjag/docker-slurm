Docker Slurm Compute 'Cluster'
==============================

Simple slurm controlled compute cluster, as docker containers.

Contains two containers, 'slurmctrl' and 'node1'.
The 'slurmctrl' runs the slurm controller service, slurmctrld.
The 'node1' runs slurmd service, and can be scheduled to run jobs in the 'cluster'

The hole contraption is build around docker compose specification.


Building
--------

Run 'docker-compose build' command in this directory.

This will create two docker images for 'slurmctrl' and 'node1' containers.


Running
-------

Run 'docker-compose up -d' in this directory.

Will start both containers. Attach to either, for exaple by using 'docker exec -ti slurmctl bash'
Once inside the container, the slurm commands such as srun, sbatch, squeue should be available.
