naclports
---------

This is an independent record repository which keeps track of what utilities I have ported to Native Client. Native Client is a sandbox technology from Google which allows the developer to run native C/C++ code (Java supposedly later) efficiently and securely in the browser, giving the code complete access to the CPU, independent of the OS, provided you have Chromium/Chrome. Some of these ports have been accepted [here](http://code.google.com/p/naclports/).

List of Ports
----------------
<table bgcolor=white>
<tr>
<td>port</td>
<td>status</td>
<td>additional</td>
<tr>
<td>`gawk`</td>
<td><img src="https://img.shields.io/badge/status-complete-green.svg"/></td>
<td>
  <ul>
    <li> version 4.1.1
  </ul>
</td>
</tr>
<tr>
<td>`perl`</td>
<td><img src="https://img.shields.io/badge/status-incomplete-orange.svg"/></td>
<td>
  <ul>
    <li> GSoC15 project, more details on [Melange](https://www.google-melange.com/gsoc/project/details/google/gsoc2015/agaurav77/5649050225344512) and at my [blog](http://agaurav77.github.io/blog/).
    <li> microperl added (16/05/15) 
</td>
</tr>
<tr>
<td>`tree`</td>
<td><img src="https://img.shields.io/badge/status-complete-green.svg"/></td>
<td>
  <ul>
    <li> version 1.7.0
    <li>one of my favourite ls-like utilities, so I had to do this one.
  </ul>
</td>
</tr>
<tr>
<td>`devenvx`</td>
<td></td>
<td>
  <ul>
    <li>local devenv tailored to my needs
  </ul>
</td>
</tr>
</table>

Using the `devenvx` (Linux)
-----------------------

Please note the devenvx is a modification of the devenv (NaCl Development Environment), available as a Chrome plugin.

1. Follow the instructions on [this](http://code.google.com/p/naclports/wiki/HowTo_Checkout) page to install `depot-tools` (installs `gclient`), and sync your local copy with `naclports` repository as described on the page.
2. You'll need Pepper to build the ports in `naclports`. Download `pepper_canary` from [gonacl.com](http://www.gonacl.com), which can be installed as a part of `nacl_sdk`.
3. In terminal, change directory to `naclports/src/ports`.
4. Download my ports using `git clone git@github.com:agaurav77/naclports.git`. This will download and place all the files there.
5. Change directory to `naclports/src`.
6. Type `bin/naclports build devenvx`. This will build `devenvx` for your architecture.
7. Do `make run` in the same directory. This will most likely start a python server which can be accessed from Chrome at `localhost:5103`.
8. After this, navigate to `localhost:5103` in Chrome. Choose `devenvx`, and go to `newlib/app`, and open `bash.html`.
9. Now you have your devenv. Enjoy!

For package installations, do `package -f -L -i <package-name>` while the python server is running (after building the package using `bin/naclports build <package-name>`). This will install it in the devenv. Reload the devenv to use the package, or use `. setup-environment` to refresh package index, and use the package.
