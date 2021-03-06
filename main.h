/* \file main.h
 */

/*! \mainpage The Atari Jaguar C library
*
* \section intro_sec Introduction
*
* This is the documentation of the Atari Jaguar C library. This
* library is intended to implement eventually a full ANSI C
* library. It has been especially targeted for the Atari Jaguar since
* some parts are written in assembler and takes into account some
* specifities of this platform. In addition, this C library contains
* the source of a generic startup code for the Atari Jaguar (crt0.s).
*
* \section Installation
*
* The easiest way to install this library is to get your hands on a
* binary distribution of it. Then copy the header files in a directory
* where your C compiler will look after (include directory) and the
* objects and archive files in a directory where your linker will look
* after (lib directory).
*
* Provided that your compilation environment is correctly set up, you
* can also alternatively build the library with the 'make' command and
* then install it where you want with the 'make install' command. You
* might have to change the TARGET variable of the Makefile to indicate
* where you want all the files to be copied.
*
* \section license_sec License
*
* The following license applies to every file of the distribution but
* except the file jaguar.inc.
*
* Copyright (C) 2006 Seb/The Removers
* http://removers.atari.org/
*
* This library is free software; you can redistribute it and/or 
* modify it under the terms of the GNU Lesser General Public 
* License as published by the Free Software Foundation; either 
* version 2.1 of the License, or (at your option) any later version. 
*
* This library is distributed in the hope that it will be useful, 
* but WITHOUT ANY WARRANTY; without even the implied warranty of 
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
* Lesser General Public License for more details. 
*
* You should have received a copy of the GNU Lesser General Public 
* License along with this library; if not, write to the Free Software 
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA 
*
*
*/

