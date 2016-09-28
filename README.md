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

  Currently it's rejected from TizenStore as reviewer
   is 'Unable to understand functionality of app'.

  Now, I am wondering if a full functional terminal
   like EFL's terminology could be accepted to tizenstore.com.

  There is no fixed width fonts available on platform.

  Rebuild app from scratch using tizen-studio 1.0.

  You can also adapt it to ship your own CLI software, like:

  https://vimeo.com/161074400 iotivity-tizen-z1-gears-20160331

  Contributions are welcome, as it's FLOSS.

  Enjoy
