#!/bin/bash
apt-get install libusb-dev libccid pcscd libpcsclite1 libpcsclite-dev

# fixes:

#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGSEGV (0xb) at pc=, pid=, tid=
#
# JRE version: OpenJDK Runtime Environment 
# Java VM: OpenJDK 64-Bit Server VM
# Problematic frame:
#
# Core dump written. Default location:
#
# An error report file with more information is saved as:
# hs_err_pid.log
# Compiled method (c1)   
 # total in heap  [0x00007f43695d74d0,0x00007f43695d77c8] = 
 # relocation     [0x00007f43695d75f8,0x00007f43695d7620] = 
 # main code      [0x00007f43695d7620,0x00007f43695d76e0] = 
 # stub code      [0x00007f43695d76e0,0x00007f43695d7770] = 
 # oops           [0x00007f43695d7770,0x00007f43695d7778] = 
 # metadata       [0x00007f43695d7778,0x00007f43695d7780] = 
 # scopes data    [0x00007f43695d7780,0x00007f43695d7790] = 
 # scopes pcs     [0x00007f43695d7790,0x00007f43695d77c0] = 
 # dependencies   [0x00007f43695d77c0,0x00007f43695d77c8] = 
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#
