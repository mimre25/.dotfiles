#!/bin/zsh
micromamba create -n keyboard python=3.13 pip -y;
micromamba activate keyboard;
pip install pyserial-asyncio;
