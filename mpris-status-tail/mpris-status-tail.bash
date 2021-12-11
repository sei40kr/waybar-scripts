#!/bin/sh

playerctl -Ff '{"alt":"{{lc(status)}}","class":"{{lc(status)}}"}' status
