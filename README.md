Subject: ekzekuto
Description: Ekzekuto process launcher to execute and display output
URL: https://quitter.is/tizenhelper
Author: https://wiki.tizen.org/wiki/User:Pcoval
License: Apache-2.0
License-URL: https://spdx.org/licenses/Apache-2.0
Contact: rzr@gna.org
Keywords: terminal, exec, execute, shell, console, cli, system, bash, sh
Usage: Edit command line and press Evaluate button
Notes:

  Minimal terminal to execute systems commands or Shell scripts snippets.

  Usage is very straightforward:
   Edit command line at bottom ie: type date,
   and press 'Execute' button once to run.
   Then the upper main window will be replaced with process's output,

  Also as demonstration a simple script shell 'runme.sh' can be tested.
   but as said previously,
   it can be replaced by any UNIX command available on system, like:
   ls, pwd, date, uname, cat, find, grep, uname, ifconfig, df,
   and default shell bash.

  Again, this tool is intended to 'powerusers'
   who want to use Unix/Shell capabilities of platform.
  Developers can find this very useful to introspect
   their devices in an 'app' context.

  Currently it's published in TizenStore,
  and was sucessfully installed on Tizen Z1 running Tizen:2.4:Mobile.

  This is encouraging for other developers to put efforts
   into a full functional terminal
   like EFL's terminology or its fork Terminal3,
   they could be accepted to tizenstore.com too.

  Rebuild app from scratch using tizen-studio 1.0.

  You can also adapt it to ship your own CLI software, like:

  https://vimeo.com/161074400 iotivity-tizen-z1-gears-20160331

  Contributions are welcome, as it's FLOSS.

  Enjoy

  TODO:

  - There is no fixed width fonts available on platform
  - Provide a nice SVG icon
  - Manage stderr
  - Stress app and fix deadlocks if any
  - Port to other profiles, Tizen:2.3.1:Wearable for instance
  - Save scriptlets, in a "bookmark" list
  - Add items in TODO
