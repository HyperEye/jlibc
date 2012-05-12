/* Jaguar C library */
/* Copyright (C) 2006 Seb/The Removers */
/* http://removers.atari.org/ */

/* This library is free software; you can redistribute it and/or */
/* modify it under the terms of the GNU Lesser General Public */
/* License as published by the Free Software Foundation; either */
/* version 2.1 of the License, or (at your option) any later version. */

/* This library is distributed in the hope that it will be useful, */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU */
/* Lesser General Public License for more details. */

/* You should have received a copy of the GNU Lesser General Public */
/* License along with this library; if not, write to the Free Software */
/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA */

/** \file jagtypes.h
 * \brief Type definitions for the Jaguar
 */
#ifndef __JAGTYPES_H
#define __JAGTYPES_H

typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int int16_t;
typedef unsigned short int uint16_t;
typedef long int int32_t;
typedef unsigned long int uint32_t;
typedef long long int int64_t;
typedef unsigned long long int uint64_t;

/** A phrase is a 64 bit integer */
typedef unsigned long long phrase;

/** A double phrase is composed of two phrases */
typedef struct {
  phrase p1;
  phrase p2;
} dphrase;

/** A quad phrase is composed of four phrases */
typedef struct {
  phrase p1;
  phrase p2;
  phrase p3;
  phrase p4;
} qphrase;

#endif
