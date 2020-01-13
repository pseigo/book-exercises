#!/bin/bash

for %i in (*.md) do (sh make-pdf %i)
