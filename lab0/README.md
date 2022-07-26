# Lab 0 - Setup

This just makes sure you can run programs written in a variety of languages using my docker image. 

# Create your machine
First, [install docker](https://docs.docker.com/get-docker/) on your system.

From _your_ host computer:
```
docker create -it --name cse465 jfemiani/cse465
```
# Start your machine
```
docker start -ai cse465
```

#  Create an environment variable for your user
```
export SID=<Your student id>
echo export SID=$SID >> ~/.bashrc
```

# Testing Your Code

In a terminal, type
```bash
docker start -at cse465
git clone https://gitlab.csi.miamioh.edu/CSE465/$SID/lab0.git
cd lab0
timeout 5m make check
```


You should see "Success!" printed several times. 

# Submitting Your Results

Type 
```
timeout 5m make check && make submit
```
and paste the output into canvas.