#!/bin/sh

perl -pi.man -e "s|%(man\.)|\&\1|g" "${@}"

