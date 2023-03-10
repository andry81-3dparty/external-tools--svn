* README_EN.txt
* 2023.03.07
* external-tools--svn

1. DESCRIPTION
2. SOURCES
2.1. Source files
2.2. Download links
3. EXTERNALS
4. TESTS
5. AUTHOR

-------------------------------------------------------------------------------
1. DESCRIPTION
-------------------------------------------------------------------------------
Different SVN command line binary implementations downloaded from different
sources. Collected together for testing purposes.

-------------------------------------------------------------------------------
2. SOURCES
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
2.1. Source files
-------------------------------------------------------------------------------
subversion.apache.org/download.cgi

-------------------------------------------------------------------------------
2.2. Download links
-------------------------------------------------------------------------------
Some sort of popularity index for Windows:
  * stackoverflow.com/questions/2341134/command-line-svn-for-windows

Some sort of list of implementations:
  * subversion.apache.org/packages.html#windows
  * www.subversiondownload.com

Command line binaries download links by popularity index based on the
StackOverflow link:

* TortoiseSVN:
  - sourceforge.net/projects/tortoisesvn/files
  - tortoisesvn.net/downloads.html

* CollabNet:
  - www.collab.net/downloads/subversion

* SlinSVN:
  - sliksvn.com/pub/
  - sliksvn.com/download/

* Cygwin:
  ** Lastest versions:
    - cygwin.com
  ** Old versions:
    - www.crouchingtigerhiddenfruitbat.org/Cygwin/timemachine.html
    - ctm.crouchingtigerhiddenfruitbat.org/pub/cygwin/circa/index.html
    - svn 1.7.14-1 (1.7.35-1	1430075439	2.870	2015/04/26-121039):
      -- SORCES: ctm.crouchingtigerhiddenfruitbat.org/pub/cygwin/circa/2015/04/26/121039
      -- SETUP: 2015-02-18	2.870	setup-x86-2.870.exe	eefc257642267ab9768b0d8a1761e8c2
    - svn 1.8.17-1:
      -- SORCES: ftp://mirrors.kernel.org/sourceware/cygwin/
      -- SETUP: 2.877

* VisualSVN:
  - www.visualsvn.com/downloads/:
    * https://www.visualsvn.com/files/Apache-Subversion-1.9.5.zip

* Win32SVN:
  - sourceforge.net/projects/win32svn/files

-------------------------------------------------------------------------------
3. EXTERNALS
-------------------------------------------------------------------------------
To checkout externals you must use the
[vcstool](https://github.com/dirk-thomas/vcstool) python module.

NOTE:
  To install the module from the git repository:

  >
  python -m pip install git+https://github.com/dirk-thomas/vcstool

-------------------------------------------------------------------------------
4. TESTS
-------------------------------------------------------------------------------
The directory does include only simple tests just to ensure that the executables
can be invoked.

The full tests are part of another projects:
* `svncmd`
* `contools`

-------------------------------------------------------------------------------
5. AUTHOR
-------------------------------------------------------------------------------
andry at inbox dot ru
