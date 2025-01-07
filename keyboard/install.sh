#!/bin/zsh
micromamba create -n keyboard python=3.13 pip -y;
~/micromamba/envs/keyboard/bin/pip install pyserial-asyncio filelock;
