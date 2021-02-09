# Go Simple

A template for a simple golang service which exposes an api. Mostly a sandbox for experimenting with tools for automating the mundane in small projects.

## Workflow

This project demonstrates a framework for a light version of [trunk based development](https://trunkbaseddevelopment.com/). Feature branches are used, with the caveat that they must be kept short lived. No other long lived branches should exist.

The following branch naming conventions should be used:

Implementing new features: ```feature/*```
Hotfixing: ```hotfix/*```
Chores (Refactoring, repaying tech debt): ```chore/*```
Upgrading dependencies: ```dependencies/*```

Sticking to these naming conventions enables automated, categorised released notes to be maintained as work is merged back into main, aimiong for absolutely minimal effort in performing a release.

## Pipeline

The project utilises [Github actions](https://github.com/features/actions).