### What the hell is this?
Do you have a laptop with glorious Ubuntu on it and an on-board nvidia GPU?
You are surely aware of what a nightmare this can be. It is either not working at all or it sounds like an apache helicopter stuck in your laptop.
This is the best solution that I have found for my laptop so far.

### What does it do?
It installs the nvidia driver and configures it so it makes the least amount of noise while still working.

### Is it 100% effective?
Nope. Absolutely not. Sometimes the GPU fan still speeds up without any reason.

### How do I use it?
Well that depends.
* I have already installed the drivers.
  Great. Just run 'sudo bash part2.sh' and everything should be configured.
* I have a clean system.
  You could try to use the installer by running 'sudo bash install.sh' but as you are installing drivers as well it might require a restart. It might be better to run 'sudo bash part1.sh'

### Your code sucks!
Feel free to fork it and send a pull request if you have any ideas on how to improve it / if the code is outdated / if you know a better way to get nvidia to behave.
