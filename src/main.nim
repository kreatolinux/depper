# depper - dependency handler for nyaa
# Copyright 2022 Kreato
#
# This file is part of Kreato Linux.
#
# Kreato Linux is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Kreato Linux is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Kreato Linux.  If not, see <https://www.gnu.org/licenses/>.
import cligen

proc dephandler(pkg: string, repo: string): string =
  var deps: string
  try:
    for i in lines repo&"/"&pkg&"/deps":
      deps = dephandler(i, repo)&" "&i&" "&deps
    return deps
  except Exception:
    discard

proc depper(pkg: string, repo: string): int =
  ## Dependency handler, mainly for nyaa
  echo deduplicate(dephandler(pkg, repo).split(" "))
  result = 0

dispatch depper, help={"pkg": "The nyaa repository", "pkg": "The package name"}
