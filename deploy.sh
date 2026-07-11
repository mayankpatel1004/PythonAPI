#!/bin/bash

rm -rf /home/mayankpatel104/Documents/Projects/TestingProjects/PythonAuth/logs/*
rm -rf /home/mayankpatel104/Documents/Projects/TestingProjects/uploads/items/*

cd /home/mayankpatel104/Documents/Projects/TestingProjects/PythonAuth || exit

git add .
git commit -m "Updates $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

echo "Git Pushed successfully."
