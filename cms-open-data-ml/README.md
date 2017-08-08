# CMS Open Data + Machine Learning

## Introduction

This is introductory tutorial for hands-on session of the DS@HEP2017 workshop and the CMS Hands-on Advanced Tutorial Session (HATS). It is intended to show you how to analyze simulated and reconstructed pp collision events from the 2011 CMS Open Data release and build classifiers for differentiating boosted, merged W boson jets from QCD jets.

# Main notebook in this tutorial

 1. `cms-open-data-ml.ipynb`

## Getting started

Each user will be issued a username/password for Vanderbilt's research computing center [ACCRE](http://www.accre.vanderbilt.edu). Please keep these credentials secure! Keep in mind that these demo accounts will be closed shortly after the tutorial ends. We hope to have a dedicated jupyterhub instance configured at (https://jupyter.accre.vanderbilt.edu) to re-enable access to these resources on a permenant basis.

Before connecting, add the following lines to your `~/.ssh/config`. This will prevent your connection from SSH connection from timing out while using your notebook.

    Host *.accre.vanderbilt.edu
        ServerAliveInterval 60
        TCPKeepAlive yes
        KeepAlive yes

To begin the tutorial, you will need to make two SSH connections to ACCRE - one to start the notebook and another to forward the ports.

To start the notebook, execute the following commands (you only need to run `cmsrel` and `git` the first time).  To prevent different users trying to use the same port, please replace <ID> with your demo id in these example commands. (For example, `cmsdemo60` is id `60`.)
    
    ssh <username>@login.accre.vanderbilt.edu
    git clone https://github.com/jmduarte/scientific-python-hats
    srun --pty --partition pascal --time=12:00:00 --mem=17G  /home/meloam/ml-hats-2017/jupyter-accre.sh
    
You should see something similar to the following

    gpuXXXX.vampire
    [I 08:22:45.871 NotebookApp] Serving notebooks from local directory: /home/cmsdemo01/CMSSW_9_0_0_pre6/src
    [I 08:22:45.871 NotebookApp] 0 active kernels 
    [I 08:22:45.871 NotebookApp] The Jupyter Notebook is running at: http://localhost:88<ID>/?token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    [I 08:22:45.871 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [C 08:22:45.873 NotebookApp] 
        
        Copy/paste this URL into your browser when you connect for the first time,
        to login with a token:
            http://localhost:88<ID>/?token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Remember the hostname `gpuXXXX.vampire`, this is the hostname your notebook is running on. To access the notebook from your local laptop web browser, first create an SSH tunnel to ACCRE in order to view your jupyter instance.

    ssh -L 88<ID>:gpuXXXX.vampire:88<ID> <username>@login.accre.vanderbilt.edu
 
Then, copy/paste the URL from the first step into your web browser and from now on, all interactions with Python and your user account will be through the browser. The `-L` option we passed to ssh is forwarding Jupyter's web traffic through SSH, so your account is safe, even if you access it from home.

Jupyter and all the other Python libraries we will be studying are bundled in CMSSW. For these exercises, there is no need to install anything else.
