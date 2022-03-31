# Flashing rPi image

## Task 1

Use the official Raspberry Pi OS image flasher tool:

https://www.raspberrypi.com/software/

- Connect sdcard
- Select Raspberry Pi OS 64-bit **LITE**
- Select your sdcard
- Under advanced settings do the following
  - Change the hostname, use `x-1-master` for one rPi, then `x-1-worker` for each worker node. Replace `x` with something fun. 
  - Enable SSH
    - use `pi` as username
    - use `raspberry` as password
  - Set locale settings to US.

## Task 2

K3s requires us to add some boot parameters to Raspberry PI.

After flashing a sdcard, re-attach it and navigate to the `/boot` folder.

In the `/boot` folder, add the following to the end of the long string in `/boot/cmdline.txt`

```
cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1
```

We can now move on to the second part of the workshop, which is running ansible for installing k3s.